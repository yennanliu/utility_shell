#!/bin/sh

#------------------------------------
# basic command
# https://redis.io/commands/
#------------------------------------

# 0) connect to local redis (defult, no pwd)
brew services start redis
redis-cli 

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

# 4) String
# append to key (msg)
append msg hello
append msg world

# get by key
get msg

# 5) List
# push into list
LPUSH mylist 1 2 3

# pop element from list (from left, right)
LPOP mylist
RPOP mylist

# 6) Set
SADD myset tim jack

SMEMBERS myset

# 7) check is elment in a key
SISMEMBER myset lynn
SISMEMBER myset tim