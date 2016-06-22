#!/bin/sh
echo "Classpath: $CLASSPATH"

java -cp fuseki-server.jar org.apache.jena.fuseki.cmd.FusekiCmd $@ &
sleep 10
upload.sh
echo "All ontologies uploaded!"
sleep infinity

