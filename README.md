# ft_services-42
100/100

## Introduction
The project consists of setting up an infrastructure of different services. To do this, you
must use ***Kubernetes***. You will need to set up a multi-service cluster.
Each service will have to run in a dedicated container.
Each container must bear the same name as the service concerned and For performance
reasons, containers have to be build using ***Alpine Linux***.
Also, they will need to have a Dockerfile written by you which is called in the setup.sh.

## Mandatory Part
Services:
- **Nginx**: a server listening on ports 80 and 443. Accessible by logging into **SSH**.
- **FTPS**: listening on port 21.
- **Wordpress**: listening on port 5050, working with MySQL database.
- **PhpMyAdmin**: on port 5000 and linked with the MySQL.
- **MysQL**: for Wordpress and PhpMyAdmin.
- **Grafana**: listening on port 3000, linked with an InfluxDB database.
- **InfluxDB**: database for grafana.
- **Telegraf**: pass the data from Minikube to InfluxDB database.

## Usage

To run the services you need to have installed [**VirtualBox**](https://www.virtualbox.org/) and [**Minikube**](https://kubernetes.io/docs/tutorials/hello-minikube/), a kubernetes cluster.

- To run the services: sh start.sh
- To shut down the services: sh start.sh clean
- To remove the minikube: sh start.sh fclean