#!/bin/bash

# Script to force delete a VPC and all its dependencies
# Usage: ./force-delete-vpc.sh <vpc-id>

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <vpc-id>"
    echo "Example: $0 vpc-123456789"
    exit 1
fi

VPC_ID=$1

echo "Starting force deletion of VPC: $VPC_ID"

# Function to check if a resource exists
resource_exists() {
    local output=$1
    [[ -n $output && $output != '[]' && $output != '{}' ]]
}

# Function to wait for EKS cluster deletion
wait_for_eks_cluster_deletion() {
    local cluster_name=$1
    echo "Waiting for EKS cluster $cluster_name to be deleted..."
    while true; do
        if ! aws eks describe-cluster --name "$cluster_name" 2>/dev/null; then
            echo "EKS cluster $cluster_name has been deleted"
            break
        fi
        echo "Still waiting for EKS cluster deletion..."
        sleep 30
    done
}

echo "1. Checking for EKS clusters in the VPC..."
CLUSTERS=$(aws eks list-clusters --query 'clusters[]' --output text)
for cluster in $CLUSTERS; do
    CLUSTER_VPC=$(aws eks describe-cluster --name "$cluster" --query 'cluster.resourcesVpcConfig.vpcId' --output text 2>/dev/null || echo "")
    if [ "$CLUSTER_VPC" == "$VPC_ID" ]; then
        echo "Found EKS cluster $cluster in VPC. Deleting..."
        aws eks delete-cluster --name "$cluster"
        wait_for_eks_cluster_deletion "$cluster"
    fi
done

echo "2. Checking for VPC Endpoints..."
VPC_ENDPOINTS=$(aws ec2 describe-vpc-endpoints --filters Name=vpc-id,Values="$VPC_ID" --query 'VpcEndpoints[*].VpcEndpointId' --output text)
if [ -n "$VPC_ENDPOINTS" ]; then
    echo "Deleting VPC Endpoints..."
    for endpoint in $VPC_ENDPOINTS; do
        aws ec2 delete-vpc-endpoints --vpc-endpoint-ids "$endpoint"
    done
fi

echo "3. Checking for NAT Gateways..."
NAT_GATEWAYS=$(aws ec2 describe-nat-gateways --filter Name=vpc-id,Values="$VPC_ID" --query 'NatGateways[*].NatGatewayId' --output text)
if [ -n "$NAT_GATEWAYS" ]; then
    echo "Deleting NAT Gateways..."
    for nat in $NAT_GATEWAYS; do
        aws ec2 delete-nat-gateway --nat-gateway-id "$nat"
    done
    echo "Waiting for NAT Gateways to be deleted..."
    aws ec2 wait nat-gateway-available --nat-gateway-ids $NAT_GATEWAYS
fi

echo "4. Checking for Internet Gateways..."
IGW=$(aws ec2 describe-internet-gateways --filters Name=attachment.vpc-id,Values="$VPC_ID" --query 'InternetGateways[*].InternetGatewayId' --output text)
if [ -n "$IGW" ]; then
    echo "Detaching and deleting Internet Gateway..."
    aws ec2 detach-internet-gateway --internet-gateway-id "$IGW" --vpc-id "$VPC_ID"
    aws ec2 delete-internet-gateway --internet-gateway-id "$IGW"
fi

echo "5. Terminating EC2 Instances..."
INSTANCES=$(aws ec2 describe-instances --filters Name=vpc-id,Values="$VPC_ID" --query 'Reservations[*].Instances[*].InstanceId' --output text)
if [ -n "$INSTANCES" ]; then
    echo "Terminating instances..."
    aws ec2 terminate-instances --instance-ids $INSTANCES
    echo "Waiting for instances to terminate..."
    aws ec2 wait instance-terminated --instance-ids $INSTANCES
fi

echo "6. Deleting Security Groups..."
# Get all security groups except the default one
SECURITY_GROUPS=$(aws ec2 describe-security-groups --filters Name=vpc-id,Values="$VPC_ID" --query 'SecurityGroups[?GroupName!=`default`].GroupId' --output text)
if [ -n "$SECURITY_GROUPS" ]; then
    echo "Deleting security groups..."
    for sg in $SECURITY_GROUPS; do
        aws ec2 delete-security-group --group-id "$sg" 2>/dev/null || echo "Could not delete security group $sg"
    done
fi

echo "7. Deleting Subnets..."
SUBNETS=$(aws ec2 describe-subnets --filters Name=vpc-id,Values="$VPC_ID" --query 'Subnets[*].SubnetId' --output text)
if [ -n "$SUBNETS" ]; then
    echo "Deleting subnets..."
    for subnet in $SUBNETS; do
        aws ec2 delete-subnet --subnet-id "$subnet"
    done
fi

echo "8. Deleting VPC..."
aws ec2 delete-vpc --vpc-id "$VPC_ID"

echo "VPC $VPC_ID has been successfully deleted along with all its dependencies."
