#!/bin/sh
# s-post fails because it does not send the file as multipart as required by Fuseki.
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/skos.rdf" http://localhost:3030/all/upload
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/juho-skos.ttl" http://localhost:3030/all/upload
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/jupo-skos.ttl" http://localhost:3030/all/upload
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/liito-skos.ttl" http://localhost:3030/all/upload
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/ptvl-skos.ttl" http://localhost:3030/all/upload
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/tero-skos.ttl" http://localhost:3030/all/upload
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/tsr-skos.ttl" http://localhost:3030/all/upload
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/yso-skos.ttl" http://localhost:3030/all/upload

curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/skos.rdf" http://localhost:3030/all_no_inference/upload
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/juho-skos.ttl" http://localhost:3030/all_no_inference/upload
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/jupo-skos.ttl" http://localhost:3030/all_no_inference/upload
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/liito-skos.ttl" http://localhost:3030/all_no_inference/upload
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/ptvl-skos.ttl" http://localhost:3030/all_no_inference/upload
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/tero-skos.ttl" http://localhost:3030/all_no_inference/upload
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/tsr-skos.ttl" http://localhost:3030/all_no_inference/upload
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@ontologies/yso-skos.ttl" http://localhost:3030/all_no_inference/upload
