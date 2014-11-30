# Centos based container with Java and Tomcat
FROM centos:centos7
MAINTAINER kirillf

# Install prepare infrastructure
RUN yum -y update && \
yum -y install wget && \
yum -y install tar

# Prepare environment 
ENV JAVA_HOME /opt/java
ENV CATALINA_HOME /opt/tomcat 
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin

# Install Oracle Java7
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz && tar -xvf jdk-7u71-linux-x64.tar.gz && \
rm jdk*.tar.gz && \
mv jdk* ${JAVA_HOME}


# Install Tomcat
RUN wget http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-8/v8.0.15/bin/apache-tomcat-8.0.15.tar.gz && tar -xvf apache-tomcat-8.0.15.tar.gz && \
rm apache-tomcat*.tar.gz && \
mv apache-tomcat* ${CATALINA_HOME} 

RUN chmod +x ${CATALINA_HOME}/bin/*sh

# Create tomcat user
RUN groupadd -r tomcat -g 433 && useradd -u 433 -r -g tomcat -d ${CATALINA_HOME} -s /sbin/nologin -c "Tomcat user" tomcat && \
chown -R tomcat:tomcat ${CATALINA_HOME}

WORKDIR /opt/tomcat

EXPOSE 8009
EXPOSE 8080

USER tomcat
CMD ["/opt/tomcat/bin/catalina.sh start"]
