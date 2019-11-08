-- https://razorsql.com/articles/redshift_find_kill_session.html

-- list the running queries
SELECT
	procpid,
	datname,
	usename,
	current_query,
	query_start
FROM
	pg_catalog.pg_stat_activity;

-- kill the running queries
SELECT pg_terminate_backend(9556);
				