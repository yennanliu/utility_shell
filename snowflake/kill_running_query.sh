#!/bin/sh

# https://docs.snowflake.net/manuals/sql-reference/functions/system_cancel_query.html
# go to snowflake UI get the query id 
# e.g.  query id = d5493e36-5e38-48c9-a47c-c476f2111ce5
#
#
# select system$cancel_query('d5493e36-5e38-48c9-a47c-c476f2111ce5');
#
#+-------------------------------------------------------------+
#| SYSTEM$CANCEL_QUERY('D5493E36-5E38-48C9-A47C-C476F2111CE5') |
#|-------------------------------------------------------------|
#| query [d5493e36-5e38-48c9-a47c-c476f2111ce5] terminated.    |
#+-------------------------------------------------------------+
#


select system$cancel_query(<ur_query_id>);
