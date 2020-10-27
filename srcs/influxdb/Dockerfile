# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fulldemo <fulldemo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/15 17:08:52 by fulldemo          #+#    #+#              #
#    Updated: 2020/10/21 19:29:40 by fulldemo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update

#Install InfluxDB
RUN	apk update && apk add influxdb && \
	rm -rf /var/cache/apk/*

EXPOSE	8086

CMD /usr/sbin/influxd