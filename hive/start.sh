#!/bin/sh
echo "Start hadoop..."
for x in `cd /etc/init.d ; ls hadoop-*` ; do 
	service $x start &
done

echo "Start master & regionserver & thrift"
service hbase-master start
service hbase-regionserver start &
service hbase-thrift start &

echo "Start hive & impala servers"
service hive-server2 start &
service impala-catalog start &
service impala-state-store start
service impala-server start &

# infinite loop
while :; do sleep 5; done