#!/bin/sh
echo "-----------------------------"
echo " Remove limit"
echo "-----------------------------"
# remove limit
# ref : https://github.com/ambling/hadoop-docker/commit/cd549b12fc939e12f8afe67cd9050f298e98a4b8
rm -f /etc/security/limits.d/hbase.conf

echo "-----------------------------"
echo "Setup HBase"
echo "-----------------------------"
# start HDFS
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do service $x stop ; done
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do service $x start ; done

# stop service
service hbase-master stop
service hbase-regionserver stop

# create /hbase dir in HDFS
su hdfs -c "hadoop fs -mkdir /hbase"
su hdfs -c "hadoop fs -chown hbase /hbase"

echo "-----------------------------"
echo "Cleanup"
echo "-----------------------------"
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do service $x stop ; done
service hbase-master stop
service hbase-regionserver stop