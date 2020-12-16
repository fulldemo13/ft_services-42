# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fulldemo <fulldemo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/15 16:50:43 by fulldemo          #+#    #+#              #
#    Updated: 2020/12/16 13:58:21 by fulldemo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN		apk update

#Intall Telegraf
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
RUN		rm -rf /var/cache/apk/*

CMD		/usr/bin/telegraf