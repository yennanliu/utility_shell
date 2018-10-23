#!/bin/sh


cd ~ && cd noths-airflow
astro airflow kill
astro airflow start 
export PYTHONPATH="/Users/$USER/noths-airflow/dags"
./bin/dev-populate-airflow