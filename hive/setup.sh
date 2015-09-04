#!/bin/sh
echo "-----------------------------"
echo "Setup HBase"
echo "-----------------------------"
# start HDFS
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do service $x stop ; done
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do service $x start ; done

#chsh -s /bin/bash hive
su hdfs -c 'hdfs dfs -mkdir -p /user/hive/warehouse'
su hdfs -c 'hdfs dfs -chmod 1777 /user/hive/warehouse'
su hdfs -c 'hdfs dfs -chown -R hive /user/hive'

echo "-----------------------------"
echo "Cleanup"
echo "-----------------------------"
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do service $x stop ; done
service hbase-master stop
service hbase-regionserver stop