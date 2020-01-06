########################
# COPY DATA 
########################

# STEP 1) cp data from s3 to EMR HDFS
# bash
# hadoop distcp  s3://hadoop-etl-dev/data /data
# STEP 2) check the result
# hdfs dfs -cat hdfs://localhost:9000/student_data.txt

########################
# LOAD DATA 
########################

# METHOD 1) load data from s3 to EMR HDFS
# pig
student = LOAD 's3://hadoop-etl-dev/data/student_data.txt' 
   USING PigStorage(',')
   as ( id:int, firstname:chararray, lastname:chararray, phone:chararray, 
   city:chararray );

B = LOAD 's3://hadoop-etl-dev/data/b.txt' using PigStorage(',') AS (a:int, b:int, c:int, d:int, e:int, f:int);

DUMP student;
DUMP B;

# METHOD 2) load data from EMR HDFS directly 

########################
# FILTER DATA 
########################

B_ = FILTER B BY (d == 8);
DUMP B_;
DESCRIBE B_;

########################
# STORE DATA 
########################

# METHOD 1) save to EMR HDFS
# pig
STORE student INTO ' hdfs://localhost:9000/pig_output/' USING PigStorage (',');

# METHOD 2) save to S3
STORE student INTO 's3://hadoop-etl-dev/pig_output/student.txt' USING PigStorage (',');
