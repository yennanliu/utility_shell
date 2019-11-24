

# create an emr and make it termate with finished launch process
# http://queirozf.com/entries/creating-a-spark-cluster-on-aws-emr-a-tutorial
aws emr create-cluster \
    --name "my emr 1-node cluster" \
    --instance-type m3.xlarge \
    --release-label emr-4.1.0 \
    --instance-count 1 \
    --use-default-roles \
    --applications Name=Spark \
    --auto-terminate
