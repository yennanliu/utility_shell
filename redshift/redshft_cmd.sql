# 1) know disk usage (single node)
# https://www.infoq.cn/article/yudaymzeokmbr3zgwxag

select owner, host, diskno, used, capacity,
(used-tossed)/capacity::numeric *100 as pctused
from stv_partitions
order by owner;

# 2) know disk usage (single table)
# https://www.infoq.cn/article/yudaymzeokmbr3zgwxag

WITH tbl_ids AS
  (SELECT DISTINCT oid
   FROM pg_class c
   WHERE relowner>1
     AND relkind='r'),
     stp AS
  (SELECT id,
          sum(ROWS)sum_r,
          sum(sorted_rows)sum_sr,
          min(ROWS)min_r,
          max(ROWS)max_r,
          nvl(count(DISTINCT slice), 0)pop_slices
   FROM stv_tbl_perm
   WHERE id IN
       (SELECT oid
        FROM tbl_ids)
     AND slice<6400
   GROUP BY id),
     colenc AS
  (SELECT attrelid,
          sum(CASE
                  WHEN a.attencodingtype=0 THEN 0
                  ELSE 1
              END) AS encoded_cols,
          count(*)AS cols
   FROM pg_attribute a
   WHERE a.attrelid IN
       (SELECT oid
        FROM tbl_ids)
     AND a.attnum>0
   GROUP BY a.attrelid),
     cluster_info AS
  (SELECT COUNT(DISTINCT node) node_count
   FROM stv_slices)
SELECT ti.database,
       ti.schema||'.'||ti."table"AS tablename,
       ti.diststyle,
       ti.sortkey1,
       ti.size current_size,
       nvl(CASE
               WHEN stp.sum_r=stp.sum_sr
                    OR stp.sum_sr=0 THEN CASE
                                             WHEN"diststyle"='EVEN' THEN CASE
                                                                             WHEN ti.sortkey1 != '' THEN (stp.pop_slices*(colenc.cols+3)*2)
                                                                             ELSE (stp.pop_slices*(colenc.cols+3))
                                                                         END
                                             WHEN substring("diststyle", 1, 3)='KEY' THEN CASE
                                                                                              WHEN ti.sortkey1 != '' THEN (stp.pop_slices*(colenc.cols+3)*2)
                                                                                              ELSE (stp.pop_slices*(colenc.cols+3))
                                                                                          END
                                             WHEN"diststyle"='ALL' THEN CASE
                                                                            WHEN ti.sortkey1 != '' THEN cluster_info.node_count*(colenc.cols+3)*2
                                                                            ELSE cluster_info.node_count*(colenc.cols+3)
                                                                        END
                                         END
               ELSE CASE
                        WHEN"diststyle"='EVEN'THEN(stp.pop_slices*2*(colenc.cols+3))
                        WHEN substring("diststyle", 1, 3)='KEY' THEN(stp.pop_slices*(colenc.cols+3)*2)
                        WHEN"diststyle"='ALL' THEN(cluster_info.node_count*(colenc.cols+3)*2)
                    END
           END, 0) AS minimum_size
FROM svv_table_info ti
LEFT JOIN stp ON stp.id=ti.table_id
LEFT JOIN colenc ON colenc.attrelid=ti.table_id
CROSS JOIN cluster_info
WHERE ti.schema='sh'
ORDER BY ti.size DESC;

# 3) connection count
# https://www.infoq.cn/article/yudaymzeokmbr3zgwxag

SELECT c.remotehost,
       count(*)
FROM stv_sessions s
LEFT JOIN stl_connection_log c ON s.process=c.pid
WHERE event='authenticated'
  AND s.user_name<>'abv'
GROUP BY 1
ORDER BY 2 DESC;

# 4) monitor WLM queue
# https://www.infoq.cn/article/yudaymzeokmbr3zgwxag

CREATE VIEW WLM_QUEUE_STATE_VW AS
SELECT (config.service_class-5) AS queue ,
       TRIM (class.condition) AS description ,
            config.num_query_tasks AS slots ,
            config.query_working_mem AS mem ,
            config.max_execution_time AS max_time ,
            config.user_group_wild_card AS "user_*" ,
            config.query_group_wild_card AS "query_*" ,
            state.num_queued_queries queued ,
            state.num_executing_queries executing ,
            state.num_executed_queries executed
FROM STV_WLM_CLASSIFICATION_CONFIG CLASS,
                                   STV_WLM_SERVICE_CLASS_CONFIG config,
                                   STV_WLM_SERVICE_CLASS_STATE state
WHERE class.action_service_class = config.service_class
  AND class.action_service_class = state.service_class
  AND config.service_class > 4
ORDER BY config.service_class;

# 5) check table skew
# https://www.infoq.cn/article/yudaymzeokmbr3zgwxag

SELECT trim(pgn.nspname) AS SCHEMA,
       trim(a.name) AS TABLE,
       id AS tableid,
       decode(pgc.reldiststyle, 0, 'even', 1, det.distkey, 8, 'all') AS distkey,
       dist_ratio.ratio::decimal(10, 4) AS skew,
       det.head_sort AS "sortkey",
       det.n_sortkeys AS "#sks",
       b.mbytes,
       decode(b.mbytes, 0, 0, ((b.mbytes/part.total::decimal)*100)::decimal(5, 2)) AS pct_of_total,
       decode(det.max_enc, 0, 'n', 'y') AS enc,
       a.rows,
       decode(det.n_sortkeys, 0, NULL, a.unsorted_rows) AS unsorted_rows,
       decode(det.n_sortkeys, 0, NULL, decode(a.rows, 0, 0, (a.unsorted_rows::decimal(32)/a.rows)*100))::decimal(5, 2) AS pct_unsorted
FROM
  (SELECT db_id,
          id,
          name,
          sum(ROWS) AS ROWS,
          sum(ROWS)-sum(sorted_rows) AS unsorted_rows
   FROM stv_tbl_perm a
   GROUP BY db_id,
            id,
            name) AS a
JOIN pg_class AS pgc ON pgc.oid = a.id
JOIN pg_namespace AS pgn ON pgn.oid = pgc.relnamespace
LEFT OUTER JOIN
  (SELECT tbl,
          count(*) AS mbytes
   FROM stv_blocklist
   GROUP BY tbl) b ON a.id=b.tbl
INNER JOIN
  (SELECT attrelid,
          min(CASE attisdistkey
                  WHEN 't' THEN attname
                  ELSE NULL
              END) AS "distkey",
          min(CASE attsortkeyord
                  WHEN 1 THEN attname
                  ELSE NULL
              END) AS head_sort,
          max(attsortkeyord) AS n_sortkeys,
          max(attencodingtype) AS max_enc
   FROM pg_attribute
   GROUP BY 1) AS det ON det.attrelid = a.id
INNER JOIN
  (SELECT tbl,
          max(mbytes)::decimal(32)/min(mbytes) AS ratio
   FROM
     (SELECT tbl,
             trim(name) AS name,
             slice,
             count(*) AS mbytes
      FROM svv_diskusage
      GROUP BY tbl,
               name,
               slice)
   GROUP BY tbl,
            name) AS dist_ratio ON a.id = dist_ratio.tbl
JOIN
  (SELECT sum(capacity) AS total
   FROM stv_partitions
   WHERE part_begin=0 ) AS part ON 1=1
WHERE mbytes IS NOT NULL
ORDER BY mbytes DESC;

# 5) get top 50 slow SQL in last 7 days
# https://www.infoq.cn/article/yudaymzeokmbr3zgwxag

SELECT trim(DATABASE) AS db,
       count(query) AS n_qry,
       max(SUBSTRING (qrytext, 1, 80)) AS qrytext,
       min(run_minutes) AS "min",
       max(run_minutes) AS "max",
       avg(run_minutes) AS "avg",
       sum(run_minutes) AS total,
       max(query) AS max_query_id,
       max(starttime)::date AS last_run,
       sum(alerts) AS alerts,
       aborted
FROM
  (SELECT userid,
          label,
          stl_query.query,
          trim(DATABASE) AS DATABASE,
          trim(querytxt) AS qrytext,
          md5(trim(querytxt)) AS qry_md5,
          starttime,
          endtime,
          (datediff(seconds, starttime, endtime)::numeric(12, 2))/60 AS run_minutes,
          alrt.num_events AS alerts,
          aborted
   FROM stl_query
   LEFT OUTER JOIN
     (SELECT query,
             1 AS num_events
      FROM stl_alert_event_log
      GROUP BY query) AS alrt ON alrt.query = stl_query.query
   WHERE userid <> 1
     AND starttime >= dateadd(DAY, -7, CURRENT_DATE))
GROUP BY DATABASE,
         label,
         qry_md5,
         aborted
ORDER BY total DESC
LIMIT 50;

# 6) check performance alert record
Select * from stl_alert_event_log where query = <MyQueryID>;

# 7) check query report
select * from svl_query_report where query = <MyQueryID> order by segment, step, elapsed_time, rows;

# 8) show table rows count under schema
# https://dataedo.com/kb/query/amazon-redshift/list-of-tables-by-the-number-of-rows

select tab.table_schema,
       tab.table_name,
       tinf.tbl_rows as rows
from svv_tables tab
join svv_table_info tinf
          on tab.table_schema = tinf.schema
          and tab.table_name = tinf.table
where tab.table_type = 'BASE TABLE'
      and tab.table_schema not in('pg_catalog','information_schema')
      and tinf.tbl_rows > 1
order by tinf.tbl_rows desc;

# 9) show table owner with table name
# https://stackoverflow.com/questions/29853079/how-to-list-all-tables-and-their-creators-or-owners-in-redshift
select tablename, tableowner, * From pg_tables  
where tablename = 'xxx'
limit 10;

# 10) show daat / files are processed
select b.query,
       count(distinct b.bucket || b.key)  as distinct_files,
      sum(b.transfer_size) / 1024 / 1024 as MB_scanned,
      sum(b.transfer_time)               as load_micro
      from stl_s3client b
      where b.http_method = 'GET' and query = '3200'
      group by 1;


# 11)  show how many data was inserted
select query,
             tbl,
             sum(rows)                                             as rows_inserted,
             max(endtime)                                          as endtime,
             datediff('microsecond', min(starttime), max(endtime)) as insert_micro
      from stl_insert
      group by query, tbl

# 12) show view definition (table behind view)
SHOW view_name;
