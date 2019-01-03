#!/bin/sh

#################################################################
# USEFUL COMMANDS ON GOOGLE BIGQUERY COMMAND LINE   
#################################################################


# 1) LIST ALL TABLES UNDER DATASET 
# https://cloud.google.com/bigquery/docs/datasets#bigquery-get-dataset-cli
# bq CLI 
bq --location=US query --use_legacy_sql=false '
SELECT
  table_id
FROM
  `bigquery-public-data.samples.__TABLES_SUMMARY__`'


# 2) show table schema 
bq show --schema --format=prettyjson mydataset.mytable

