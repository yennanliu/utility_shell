echo ">>> START MAKING DIRECTORY ...."

for i in {01..18};
do 
    for  j in {01..24};
        do 
            echo "dfs -mkdir -p my_directory/day=$i/hour=$j/_SUCCESS"
            hdfs dfs -mkdir -p my_directory/day=$i/hour=$j/_SUCCESS
        done
done

echo ">>>> FINISHED !"