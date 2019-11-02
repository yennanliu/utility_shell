# file to s3 
# https://docs.aws.amazon.com/cli/latest/reference/s3/index.html

# V0

# V1

# V2
# https://gist.github.com/chrismdp/6c6b6c825b07f680e710
#S3 parameters
S3KEY="my-key"
S3SECRET="my-secret"
S3BUCKET="my-bucket"
S3STORAGETYPE="STANDARD" #REDUCED_REDUNDANCY or STANDARD etc.
AWSREGION="s3-xxxxxx"

function put_to_s3
{
  path=$1
  file=$2
  aws_path=$3
  bucket="${S3BUCKET}"
  date=$(date +"%a, %d %b %Y %T %z")
  acl="x-amz-acl:private"
  content_type="application/octet-stream"
  storage_type="x-amz-storage-class:${S3STORAGETYPE}"
  string="PUT\n\n$content_type\n$date\n$acl\n$storage_type\n/$bucket$aws_path$file"
  signature=$(echo -en "${string}" | openssl sha1 -hmac "${S3SECRET}" -binary | base64)
  curl -s -X PUT -T "$path/$file" \
    -H "Host: $bucket.${AWSREGION}.amazonaws.com" \
    -H "Date: $date" \
    -H "Content-Type: $content_type" \
    -H "$storage_type" \
    -H "$acl" \
    -H "Authorization: AWS ${S3KEY}:$signature" \
    "https://$bucket.${AWSREGION}.amazonaws.com$aws_path$file"
}

put_to_s3
