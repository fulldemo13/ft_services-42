# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fulldemo <fulldemo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/18 11:24:41 by fulldemo          #+#    #+#              #
#    Updated: 2021/02/03 19:55:58 by fulldemo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


FROM	alpine:3.12.0

RUN		apk update &&\
		apk add openssl &&\
		apk add vsftpd &&\
		rm -rf /var/cache/apk/*

#FTPS conf
RUN		echo -e "user\nuser" | adduser user -h /ftps_user;
RUN		chown user:user /ftps_user
RUN		touch /var/log/vsftpd.log
RUN		echo "user" >> /etc/vsftpd/vsftpd.userlist

#SSL
RUN		openssl req -x509 -out /etc/ssl/certs/vsftpd.crt -keyout /etc/ssl/private/vsftpd.key -newkey rsa:2048 -nodes -sha256 -subj '/CN=localhost'

EXPOSE	20 21 31000

CMD		vsftpd /etc/vsftpd/vsftpd.conf