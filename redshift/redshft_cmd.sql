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
