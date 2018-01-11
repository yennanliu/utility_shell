# https://gist.github.com/mderazon/8201991

OIFS=$IFS;
IFS=",";

# fill in your details here
dbname=yourdbname
host=yourmongohostname

# first get all collections in the database
#collections=`mongo "$host/$dbname"  --eval "rs.slaveOk();db.getCollectionNames();"`;
collections=ClanInvited
collectionArray=($collections);
# for each collection
for ((i=0; i<${#collectionArray[@]}; ++i));
do
    echo 'exporting collection' ${collectionArray[$i]}
    keys=`python ~/get_mongo_keys.py $col`

	# now use mongoexport with the set of keys to export the collection to csv
	echo $keys
    mongoexport --host $host -d $dbname -c ${collectionArray[$i]} --fields "$keys" --csv --out $dbname.${collectionArray[$i]}.csv;



done
IFS=$OIFS;
