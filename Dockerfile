# Pull base image
FROM java:8-jre

#Download fuseki
RUN wget -O fuseki.tar.gz http://www.nic.funet.fi/pub/mirrors/apache.org/jena/binaries/apache-jena-fuseki-2.6.0.tar.gz && \
    tar zxf fuseki.tar.gz && \
    mv apache-jena-fuseki* /jena-fuseki && \
    rm fuseki.tar.gz* && \
    cd /jena-fuseki

#Download Pellet reasoner
# Note: The following does not work with the new Jena.
# https://github.com/Complexible/pellet/archive/master.tar.gz && \
# Note: The Finnish ontologies are not compatible with Pellet yet, as they are inconsistent in typing.
#RUN wget -O pellet.tar.gz https://github.com/oscii/pellet/archive/master.tar.gz && \
#    tar zxf pellet.tar.gz && \
#    cd pellet-master && \
#    mvn package -DskipTests && \
#    cd ..

#ENV CLASSPATH /pellet-master/jena/target/pellet-jena-2.4.0-SNAPSHOT.jar:/pellet-master/core/target/pellet-core-2.4.0-SNAPSHOT.jar:/pellet-master/cli/target/pelletcli/lib/jena-core-2.13.0.jar:/pellet-master/cli/target/pelletcli/lib/aterm-java-1.8.2-p1.jar:/pellet-master/cli/target/pelletcli/lib/jjtraveler-0.6.jar:/pellet-master/cli/target/pelletcli/lib/shared-objects-1.4.9-p1.jar

# Copy shiro.ini file which allows operations outside localhost
COPY config/shiro.ini /jena-fuseki/run/shiro.ini
COPY config/config.ttl /jena-fuseki/config.ttl
COPY ontologies/* /jena-fuseki/ontologies/
COPY scripts/upload.sh /jena-fuseki/upload.sh
COPY scripts/start.sh /jena-fuseki/start.sh

ENV PATH /jena-fuseki:$PATH
WORKDIR /jena-fuseki
EXPOSE 3030

ENTRYPOINT ["start.sh"]
