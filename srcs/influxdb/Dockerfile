# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fulldemo <fulldemo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/15 17:08:52 by fulldemo          #+#    #+#              #
#    Updated: 2021/02/03 19:56:46 by fulldemo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.0

RUN apk update

#Install InfluxDB
RUN	apk update && apk add influxdb && \
	rm -rf /var/cache/apk/*

EXPOSE	8086

CMD /usr/sbin/influxd