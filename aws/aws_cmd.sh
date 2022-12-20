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
