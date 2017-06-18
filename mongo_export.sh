#!/bin/sh

#  https://www.drzon.net/posts/export-mongodb-collections-to-csv-without-specifying-fields/
#  https://stackoverflow.com/questions/6814151/how-to-export-collection-to-csv-in-mongodb

# =======

#var schematodo = db.Gaming.findOne();
#for (var key in schematodo) { print (key) ; }

# =======

# cat Gaming.json | recs-tocsv > gaming.csv
### config go and json2csv ###
#https://stackoverflow.com/questions/20628918/cannot-download-gopath-not-set
# cat Subscription.json  | jq   --raw-output '.subscriberUserID, .subscriptionTime'

# =======



mongoexport --host yourmongohost:yourmongoport --db yourdbname --collection yourcollection --csv --out mongo_export.csv --fields file1,file2,file3
