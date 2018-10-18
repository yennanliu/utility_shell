#!/bin/sh



# https://alembic.zzzcomputing.com/en/latest/tutorial.html


# 1). create migration DB python script
alembic revision -m "create ur_table_name table"


# 2) run the migration job (upgrade)
PYTHONPATH=./ddl alembic upgrade head


# 2') rollback (downgrade)
PYTHONPATH=./ddl alembic downgrade head




## 2'') update DB table (alembic).version before re-run the migration command 
## inside DB console
# 0db6c2334442 <---- new  migration python script version 

######################################
#revision = 'dd55ac4ae7a9'
#down_revision = '0db6c2334442'
#branch_labels = None
#depends_on = None
######################################

```insert into   alembic.alembic_version  ("VERSION_NUM") values ('0db6c2334442');``` 








