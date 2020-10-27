# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fulldemo <fulldemo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/28 12:57:11 by fulldemo          #+#    #+#              #
#    Updated: 2020/10/05 11:41:40 by fulldemo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update && \
	apk add wget && \
	apk add php php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

#Install Wordpress
RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xvf latest.tar.gz && \
	mkdir /www &&\
	mv wordpress/* /www && \
	rm -rf /var/cache/apk/* && \
	rm -rf latest.tar.gz

COPY ./wp-config.php /www/wp-config.php

EXPOSE 5050

CMD php -S 0.0.0.0:5050 -t /www/