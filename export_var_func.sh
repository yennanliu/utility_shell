set_env() {
    # assert env
    if [ -z $SPARK_HOME ]; then
        echo "Need SPARK_HOME "
        exit 1
    fi

    export PYTHONPATH=<PYTHONPATH>
    export AIRFLOW_CONFIG_PATH=<AIRFLOW_CONFIG_PATH>
    export JAVA_HOME=<JAVA_HOME>
    
    echo "PYTHONPATH: $PYTHONPATH"
    echo "AIRFLOW_CONFIG_PATH: $AIRFLOW_CONFIG_PATH"
    echo "JAVA_HOME: $JAVA_HOME"
}

test_run() {
    set_env
    echo 'test_run ...'
    for i in 1 2 3 
    do 
        echo $i
    done
}
