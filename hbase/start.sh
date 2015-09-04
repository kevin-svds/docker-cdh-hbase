#!/bin/sh
echo "Start hadoop..."
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do 
	service $x start &
done

echo "Start master & regionserver & thrift"
service hbase-master start &
service hbase-regionserver start &
service hbase-thrift start &

# infinite loop
while :; do sleep 5; done