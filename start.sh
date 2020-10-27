#!/bin/bash

# Functions
clean() {
	printf "🗑  Cleaning all services...\n"

	kubectl delete -f srcs/ftps.yaml >> logs.txt
	kubectl delete -f srcs/ftps-config.yaml >> logs.txt
	kubectl delete -f srcs/mysql.yaml >> logs.txt
	kubectl delete -f srcs/phpmyadmin.yaml >> logs.txt
	kubectl delete -f srcs/wordpress.yaml >> logs.txt
	kubectl delete -f srcs/grafana.yaml >> logs.txt
	kubectl delete -f srcs/grafana-config.yaml >> logs.txt
	kubectl delete -f srcs/influxdb.yaml >> logs.txt
	kubectl delete -f srcs/telegraf.yaml >> logs.txt
	kubectl delete -f srcs/telegraf-config.yaml >> logs.txt
	kubectl delete -f srcs/nginx.yaml >> logs.txt
	kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml >> logs.txt

	printf "🗑  ✅ Clean complete!\n"
}

fclean() {
	printf "🗑  🐳 Cleaning all images...\n"

	docker rmi -f services-ftps >> logs.txt
	docker rmi -f services-mysql >> logs.txt
	docker rmi -f services-phpmyadmin >> logs.txt
	docker rmi -f services-wordpress >> logs.txt
	docker rmi -f services-grafana >> logs.txt
	docker rmi -f services-influxdb >> logs.txt
	docker rmi -f services-telegraf >> logs.txt
	docker rmi -f services-nginx >> logs.txt
	rm logs.txt
	minikube stop
	printf "🗑  🐳 ✅ fclean complete!\n"
}

# Clean if arg1 is clean or fclean
if [[ $1 = 'clean' ]]
then
	eval $(minikube docker-env)
	clean
	exit
fi

if [[ $1 = 'fclean' ]]
then
	eval $(minikube docker-env)
	clean
	sleep 1
	fclean
	exit
fi

# Start the cluster if it's not running

if [[ $(minikube status | grep -c "Running") == 0 ]]
then
	minikube start --cpus=2 --memory 4000 --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000
	minikube addons enable metrics-server
	minikube addons enable ingress
	minikube addons enable dashboard
fi


# Set the docker images in Minikube

MINIKUBE_IP=$(minikube ip)
sleep 1;
eval $(minikube docker-env)

# Install metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml >> logs.txt
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml >> logs.txt
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" >> logs.txt

kubectl apply -f srcs/metallb.yaml >> logs.txt


# Build Docker images

printf "♻️   🐳  Building Docker images...\n"

docker build -t services-ftps srcs/ftps >> logs.txt
printf "🐳 🛠  FTPS done...\n"
docker build -t services-mysql srcs/mysql >> logs.txt
printf "🐳 🛠  MySQL done...\n"
docker build -t services-phpmyadmin srcs/phpmyadmin >> logs.txt
printf "🐳 🛠  PhpMyAdmin done...\n"
docker build -t services-wordpress srcs/wordpress >> logs.txt
printf "🐳 🛠  Wordpress done...\n"
docker build -t services-telegraf srcs/telegraf >> logs.txt
printf "🐳 🛠  Telegraf done...\n"
docker build -t services-influxdb srcs/influxdb >> logs.txt
printf "🐳 🛠  InfluxDB done...\n"
docker build -t services-grafana srcs/grafana >> logs.txt
printf "🐳 🛠  Grafana done...\n"
docker build -t services-nginx srcs/nginx >> logs.txt
printf "🐳 🛠  Nginx done...\n"

printf "✅  🐳  Images builded!\n"

# Deploy services

printf "♻️  Deploying services...\n"

kubectl apply -f srcs/ftps-config.yaml >> logs.txt
kubectl apply -f srcs/ftps.yaml >> logs.txt
printf "🛠  FTPS done...\n"
kubectl apply -f srcs/mysql.yaml >> logs.txt
printf "🛠  MySQL done...\n"
kubectl apply -f srcs/phpmyadmin.yaml >> logs.txt
printf "🛠  PhpMyAdmin done...\n"
kubectl apply -f srcs/wordpress.yaml >> logs.txt
printf "🛠  Wordpress done...\n"
kubectl apply -f srcs/influxdb.yaml >> logs.txt
printf "🛠  InfluxDB done...\n"
kubectl apply -f srcs/telegraf-config.yaml >> logs.txt
kubectl apply -f srcs/telegraf.yaml >> logs.txt
printf "🛠  Telegraf done...\n"
kubectl apply -f srcs/grafana-config.yaml >> logs.txt
kubectl apply -f srcs/grafana.yaml >> logs.txt
printf "🛠  Grafana done...\n"
kubectl apply -f srcs/nginx.yaml >> logs.txt
printf "🛠  Nginx done...\n"

printf "✅ Deployed!\n"

# Show ip acces

echo "🌟 ft_services IP: ➡️  \"192.168.99.128\" ⬅️ "