copy  public.movie_ratings 
from 's3://<s3_bucket>/<s3_file>' 
iam_role 'arn:aws:iam::xxxxx:role/xxxx'
IGNOREHEADER 1   delimiter ',';
