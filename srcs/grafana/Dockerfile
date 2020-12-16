# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fulldemo <fulldemo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/15 17:08:42 by fulldemo          #+#    #+#              #
#    Updated: 2020/12/16 13:58:21 by fulldemo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update 
	
#Intall Grafana
RUN		apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community/ &&\
		rm -rf /var/cache/apk/*gz

COPY	datasource.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY	dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY	services.json /usr/share/grafana/public/dashboards/services.json

EXPOSE 3000

CMD /usr/sbin/grafana-server --config=/usr/share/grafana/conf/grafana.ini --homepath=/usr/share/grafana