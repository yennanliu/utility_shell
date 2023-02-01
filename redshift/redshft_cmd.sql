# 1) know disk usage
# https://www.infoq.cn/article/yudaymzeokmbr3zgwxag

select owner, host, diskno, used, capacity,
(used-tossed)/capacity::numeric *100 as pctused
from stv_partitions
order by owner;
