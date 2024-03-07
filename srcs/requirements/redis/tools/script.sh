#!/bin/bash
# modifie the bind 127.0.0.1 to be  0.0.0.0
sed -i "s/127.0.0.1/0.0.0.0/g" /etc/redis/redis.conf
# service start 
service redis-server start