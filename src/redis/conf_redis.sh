#!/bin/sh
redis-server /etc/redis.conf
redis cli
CONFIG SET requirepass $(REDIS_PASSWORD)
CONFIG REWRITE
AUTH default $(REDIS_PASSWORD)
acl setuser redis on >eYVX7EwVmmxKPCDmwMtyKVge8oLd2t8 +@all
CONFIG REWRITE
redis-server /etc/redis.conf --protected-mode no