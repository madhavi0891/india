FROM centos


MAINTAINER vinod9589@gmail.com

RUN mkdir /opt/tomcat/
RUN yum -y install wget
RUN yum -y install unzip

WORKDIR /opt/tomcat
RUN curl -O http://apachemirror.wuchna.com/tomcat/tomcat-8/v8.5.51/bin/apache-tomcat-8.5.51-windows-x64.zip
RUN unzip apache-tomcat-8.5.51-windows-x64.zip 
RUN mv apache-tomcat-8.5.51/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
