# add prefix list to security group

INTERNAL_PREFIX_LIST="your_prefix"

ALLOW_INBOUND_SEC_GROUP_ID="security_group_id"

AWS_REGION="us-east-1"

aws ec2 authorize-security-group-ingress \
   --region $AWS_REGION \
   --group-id $ALLOW_INBOUND_SEC_GROUP_ID \
   --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 80, "ToPort": 80, "PrefixListIds": [{"PrefixListId": "'$INTERNAL_PREFIX_LIST'"}]}]' 
