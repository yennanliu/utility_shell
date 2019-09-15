#!/bin/sh
########################################################################################################################
# REF 
# https://blog.sicara.com/get-started-pyspark-jupyter-guide-tutorial-ae2fe84f594f

# ANY JAVA VERSION ISSUE PLEASE CHECK 
# https://github.com/yennanliu/utility_shell/blob/master/spark/install_java8.sh
########################################################################################################################

# 1) run pyspark via python shell 
export SPARK_HOME=/Users/$USER/spark
export PATH=$SPARK_HOME/bin:$PATH
# run pysprak via python shell  
pyspark


# 2) run pyspark via ipython 
# launch ur dev env 
export SPARK_HOME=/Users/$USER/spark
export PYSPARK_DRIVER_PYTHON=ipython
# run pysprak via ipython 
pyspark


# 3) run pyspark via ipython notebook 
# launch ur dev env 
export SPARK_HOME=/Users/$USER/spark
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook'
# run pysprak via ipython notebook 
pyspark


# 4) run script pyspark via command lune 
export SPARK_HOME=/Users/$USER/spark
export PATH=$SPARK_HOME/bin:$PATH
# for example 
# /Users/yennanliu/spark/bin/spark-submit spark_test1.py
#./bin/spark-submit  your_python_script.py
spark-submit

