# 0) Set up Iam role in AWS
# go to https://us-east-1.console.aws.amazon.com/iamv2/home#/security_credentials/access-key-wizard
# click "Roles" (under "Access management")
# click "Create Role"
# click "add permissions"
# after complete, the ARN (e.g. : arn:aws:iam::423234423:role/dev1) can be found in the IAM console

# 1) install AWS S3 CMD (Mac)
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

# 2) config it
# https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey
# NOTE !!! you can get  AWS Access Key ID, AWS Secret Access Key via IAm page
# -> https://us-east-1.console.aws.amazon.com/iamv2/home#/security_credentials/access-key-wizard
aws configure
# AWS Access Key ID [None]: yyy
# AWS Secret Access Key [None]: xxx
# Default region name [None]: ap-northeast-1

# 3) list S3 bucket
aws s3 ls

# 4) copy local file to S3 bucket
aws s3 cp user.sql s3://yen-bucket1

# 5) list VPC under current account
# https://gist.github.com/andytumelty/3651ef79fc00908b4d9f5f6bba05489a
aws ec2 --output text --query 'Vpcs[*].{VpcId:VpcId,Name:Tags[?Key==`Name`].Value|[0],CidrBlock:CidrBlock}' describe-vpcs
