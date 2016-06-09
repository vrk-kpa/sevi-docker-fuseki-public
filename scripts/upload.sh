#!/bin/sh
# s-post fails because it does not send the file as multipart as required by Fuseki.
PORT=`netstat -lp | perl -0777 -ne 'print $1 if /\:(\d+)/'`
curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/skos.rdf" http://localhost:$PORT/all/upload
curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/juho-skos.ttl" http://localhost:$PORT/all/upload
curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/jupo-skos.ttl" http://localhost:$PORT/all/upload
curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/liito-skos.ttl" http://localhost:$PORT/all/upload
curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/ptvl-skos.ttl" http://localhost:$PORT/all/upload
curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/tero-skos.ttl" http://localhost:$PORT/all/upload
curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/tsr-skos.ttl" http://localhost:$PORT/all/upload
curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/yso-skos.ttl" http://localhost:$PORT/all/upload

curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/skos.rdf" http://localhost:$PORT/all_no_inference/upload
curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/juho-skos.ttl" http://localhost:$PORT/all_no_inference/upload
curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/jupo-skos.ttl" http://localhost:$PORT/all_no_inference/upload
curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/liito-skos.ttl" http://localhost:$PORT/all_no_inference/upload
curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/ptvl-skos.ttl" http://localhost:$PORT/all_no_inference/upload
curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/tero-skos.ttl" http://localhost:$PORT/all_no_inference/upload
curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/tsr-skos.ttl" http://localhost:$PORT/all_no_inference/upload
curl -isS -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/yso-skos.ttl" http://localhost:$PORT/all_no_inference/upload
