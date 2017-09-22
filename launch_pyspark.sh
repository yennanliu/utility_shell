#!/bin/sh



# https://blog.sicara.com/get-started-pyspark-jupyter-guide-tutorial-ae2fe84f594f




# run pyspark via python shell 


export SPARK_HOME=/Users/yennanliu/spark
export PATH=$SPARK_HOME/bin:$PATH
# run pysprak via python shell  
pyspark



#  run pyspark via ipython 

# launch ur dev env 
export SPARK_HOME=/Users/yennanliu/spark
export PYSPARK_DRIVER_PYTHON=ipython
# run pysprak via ipython 
pyspark

#  run pyspark via ipython notebook 

# launch ur dev env 
export SPARK_HOME=/Users/yennanliu/spark
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook'
# run pysprak via ipython notebook 
pyspark






