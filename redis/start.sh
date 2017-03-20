#!/bin/bash

# start redis server
for d in 7000 7001 7002 
do
  cd $d
  echo $(pwd)
  redis-server redis.conf &
  cd ..
done

# join 2 cluster
./redis-trib.rb create --replicas 0 127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002
  
