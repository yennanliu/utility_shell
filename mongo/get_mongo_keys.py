import pandas as pd
import pymongo
from pymongo import MongoClient

dbname=yourdbname
tablename=yourtablename 
host=yourmongohostname
port=yourmongoport


def get_key():
	db = MongoClient(host, port, connect=False)[yourdbname]
	keys = list((db[tablename].find_one().keys()) )
	output = ",".join(str(x) for x in keys)
	print (output)
	return output



if __name__ == '__main__':
	get_key()