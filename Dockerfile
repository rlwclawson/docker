# DOCKER-VERSION 1.3.1
FROM centos:centos6

# Install tar
RUN yum install -y tar

# add JDK & tomcat - note:  ADD unzips automatically
ADD ./bootstrap/jdk-7u71-linux-x64.gz /opt/
ADD ./bootstrap/apache-tomcat-7.0.56.tar.gz /opt/

# rename tomcat folder
RUN cd /opt; mv apache-tomcat-7.0.56 /opt/tomcat7

# setup run perms
RUN chmod -R 755 /opt/tomcat7

# setup enviornment
ENV JAVA_HOME /opt/jdk1.7.0_71

# expose tomcat
EXPOSE 8080

# set entry point - 
CMD /opt/tomcat7/bin/catalina.sh run