# Pull base image
FROM ubuntu:14.04

# Install common tools
RUN \
  apt-get update && \
  apt-get -y install python-software-properties && \
  apt-get -y install software-properties-common

# Install Java
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
  add-apt-repository ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y curl && \
  apt-get install -y oracle-java8-installer && \
  apt-get install -y ca-certificates && \
  apt-get install -y oracle-java8-unlimited-jce-policy && \
#  apt-get install -y maven && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV PATH /jena-fuseki:$PATH
ENV JVM_ARGS -Xmx2048M

#Download fuseki
RUN wget -O fuseki.tar.gz http://www.nic.funet.fi/pub/mirrors/apache.org/jena/binaries/apache-jena-fuseki-2.4.0.tar.gz && \
    tar zxf fuseki.tar.gz && \
    mv apache-jena-fuseki* /jena-fuseki && \
    rm fuseki.tar.gz* && \
    cd /jena-fuseki && \
    mkdir DB

#Download Pellet reasoner
# Note: The following does not work with the new Jena.
#https://github.com/Complexible/pellet/archive/master.tar.gz && \
# Note: The Finnish ontologies are not compatible with Pellet yet, as they are inconsistent in typing.
#RUN wget -O pellet.tar.gz https://github.com/oscii/pellet/archive/master.tar.gz && \
#    tar zxf pellet.tar.gz && \
#    cd pellet-master && \
#    mvn package -DskipTests && \
#    cd ..

#ENV CLASSPATH /pellet-master/jena/target/pellet-jena-2.4.0-SNAPSHOT.jar:/pellet-master/core/target/pellet-core-2.4.0-SNAPSHOT.jar:/pellet-master/cli/target/pelletcli/lib/jena-core-2.13.0.jar:/pellet-master/cli/target/pelletcli/lib/aterm-java-1.8.2-p1.jar:/pellet-master/cli/target/pelletcli/lib/jjtraveler-0.6.jar:/pellet-master/cli/target/pelletcli/lib/shared-objects-1.4.9-p1.jar

# Copy shiro.ini file which allows operations outside localhost
COPY shiro.ini /jena-fuseki/run/shiro.ini
COPY config.ttl /jena-fuseki/config.ttl
COPY ontologies/* /jena-fuseki/ontologies/
COPY upload.sh /jena-fuseki/upload.sh
COPY start.sh /jena-fuseki/start.sh

#VOLUME /jena-fuseki/data

WORKDIR /jena-fuseki
EXPOSE 3030

ENTRYPOINT ["start.sh"]
CMD ["--config=/jena-fuseki/config.ttl"]
