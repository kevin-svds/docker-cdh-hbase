# Based on Docker image from Yunsang Choi <oddpoet@gmail.com>
FROM kevinsvds/hadoop
MAINTAINER Kevin Zielnicki <kevinsvds@svds.com>

#=======================
# Install HBase
#=======================
RUN yum install -y \
	hbase \
	hbase-master \
	hbase-regionserver \
	hbase-thrift

#=======================
# Configure HBase pseduo-distributed
#=======================
COPY setup.sh setup.sh
RUN ["/bin/bash", "setup.sh"]

#=======================
# Start services.
#=======================
COPY hbase-site.xml /etc/hbase/conf/hbase-site.xml

COPY start.sh start.sh
CMD ["/bin/bash", "start.sh"]