# Dockerfile for sevi-fuseki providing Apache Fuseki used by [Ontology service](https://github.com/vrk-kpa/sevi-ontology-service-public).

This application is part of the [National Architecture for Digital Services programme](http://vm.fi/en/national-architecture-for-digital-services)
(Kansallinen palveluarkkitehtuuri, also known as KaPA) by [The Ministry of Finance of Finland](http://vm.fi/en/ministry) and its Service Views (Palvelunäkymät) project.

## Building the image

docker build -t sevi-fuseki .

## Running the image 

docker run --name sevi-fuseki -p 3030:3030 sevi-fuseki