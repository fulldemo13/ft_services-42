# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fulldemo <fulldemo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/28 17:44:37 by fulldemo          #+#    #+#              #
#    Updated: 2021/02/03 19:56:46 by fulldemo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.0

#Install MAriaDB
RUN apk update && \
	apk add mariadb mariadb-client openrc && \
	rm -rf /var/cache/apk/*

COPY ./setup.sh .

# Comment next line for new wordpress
COPY wordpress.sql		wordpress.sql

RUN chmod 777 setup.sh

EXPOSE 3306

CMD sh setup.sh