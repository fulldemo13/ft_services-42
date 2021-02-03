# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fulldemo <fulldemo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/15 17:08:42 by fulldemo          #+#    #+#              #
#    Updated: 2021/02/03 19:56:46 by fulldemo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.0

RUN apk update 
	
#Intall Grafana
RUN		apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community/ &&\
		rm -rf /var/cache/apk/*gz

COPY	datasource.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY	dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY	services.json /usr/share/grafana/public/dashboards/services.json

EXPOSE 3000

CMD /usr/sbin/grafana-server --config=/usr/share/grafana/conf/grafana.ini --homepath=/usr/share/grafana