# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fulldemo <fulldemo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/15 16:50:43 by fulldemo          #+#    #+#              #
#    Updated: 2021/02/03 19:56:46 by fulldemo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12.0

RUN		apk update

#Intall Telegraf
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
RUN		rm -rf /var/cache/apk/*

CMD		/usr/bin/telegraf