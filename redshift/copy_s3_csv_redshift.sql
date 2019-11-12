-- simple copy 
copy  public.movie_ratings 
from 's3://<s3_bucket>/<s3_file>' 
iam_role 'arn:aws:iam::xxxxx:role/xxxx'
IGNOREHEADER 1   delimiter ',';

-- escape csv double quote
copy  public.transaction_10_vm 
from 's3://<s3_bucket>/<s3_file>' 
iam_role 'arn:aws:iam::xxxxx:role/xxxx'
 IGNOREHEADER 1   delimiter ',' CSV QUOTE '\"' ;