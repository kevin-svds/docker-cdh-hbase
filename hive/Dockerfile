FROM kevinsvds/hbase
MAINTAINER Kevin Zielnicki <kevinsvds@svds.com>

#=======================
# Install Hive
#=======================
RUN yum install -y \
	hive \
	hive-server2 \
	hive-hbase \
	impala-server \
	impala-shell \
	impala-state-store \
	impala-catalog

#=======================
# Configure Hive
#=======================
COPY setup.sh setup.sh
RUN ["/bin/bash", "setup.sh"]

#=======================
# Start services.
#=======================
COPY hive-site.xml /etc/hive/conf/hive-site.xml

COPY start.sh start.sh
CMD ["/bin/bash", "start.sh"]
