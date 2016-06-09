#!/bin/sh
echo "Classpath: $CLASSPATH"

java -cp $CLASSPATH:fuseki-server.jar org.apache.jena.fuseki.cmd.FusekiCmd $@ &
#./fuseki-server $@ &
sleep 10
upload.sh
echo "All ontologies uploaded!"
sleep infinity

