#!/bin/sh

# 1) connect to remote redis
# https://www.1ju.org/redis/redis-quick-guide
redis-cli -h host -p port -a password
# or below for solving "Redisへのコマンド実行時に発生する”(error) MOVED”エラーを解決する方法" issue
# https://dev.classmethod.jp/articles/how-to-handle-redis-cli-moved-error/
redis-cli -c -h host -p port -a password

# 2) get all keys
# https://redis.io/commands/KEYS
keys * 

# 3) get keys with pattern
# pattern : *name*
keys *names*