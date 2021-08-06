# https://www.it-swarm-ja.com/ja/hadoop/hive%E3%81%A7%E6%97%A5%E4%BB%98%E6%96%87%E5%AD%97%E5%88%97%E3%82%92utc%E3%81%8B%E3%82%89%E7%89%B9%E5%AE%9A%E3%81%AE%E3%82%BF%E3%82%A4%E3%83%A0%E3%82%BE%E3%83%BC%E3%83%B3%E3%81%AB%E5%A4%89%E6%8F%9B%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AF%EF%BC%9F/1051115788/

SELECT
time_stamp,
year(from_utc_timestamp(from_unixtime(time_stamp), 'Asia/Tokyo')) AS year,
month(from_utc_timestamp(from_unixtime(time_stamp), 'Asia/Tokyo')) AS month,
day(from_utc_timestamp(from_unixtime(time_stamp), 'Asia/Tokyo')) AS day,
hour(from_utc_timestamp(from_unixtime(time_stamp), 'Asia/Tokyo')) AS hour
FROM 
hive_table
