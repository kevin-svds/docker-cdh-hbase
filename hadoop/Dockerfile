# Based on Docker image from Yunsang Choi <oddpoet@gmail.com>
FROM centos:centos6
MAINTAINER Kevin Zielnicki <kevinsvds@gmail.com>

#=======================
# Install utils
#=======================
RUN yum clean all
RUN yum install -y curl wget tar telnet 

#=======================
# Install JDK7 
#=======================
COPY install-jdk7.sh install-jdk7.sh
RUN bash install-jdk7.sh

#=======================
# Install Hadoop
#=======================
#ENV CDH_VER 5.2.0
ENV CDH_VER 5.4.2

# ref : http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Quick-Start/cdh5qs_yarn_pseudo.html
RUN curl http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/cloudera-cdh5.repo -o /etc/yum.repos.d/cloudera-cdh5.repo
RUN sed -i "s|cdh/5/|cdh/${CDH_VER}/|" /etc/yum.repos.d/cloudera-cdh5.repo
RUN yum install -y hadoop-conf-pseudo

#=======================
# Configure Hadoop/HDFS
#=======================
COPY core-site.xml /etc/hadoop/conf/core-site.xml

COPY setup.sh setup.sh
RUN ["/bin/bash", "setup.sh"]
