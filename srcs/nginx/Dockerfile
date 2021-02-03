# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fulldemo <fulldemo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/28 12:56:54 by fulldemo          #+#    #+#              #
#    Updated: 2021/02/03 19:56:46 by fulldemo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.0

RUN apk update && \
	apk add openssl && \
	apk --update add --no-cache openssh

# Install nginx
RUN	apk add nginx && \
	mkdir -p /run/nginx

#SSH Configuration
RUN	sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  	&& echo "root:root" | chpasswd \
  	&& rm -rf /var/cache/apk/* \
  	&& sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config \
  	&& sed -ri 's/#HostKey \/etc\/ssh\/ssh_host_key/HostKey \/etc\/ssh\/ssh_host_key/g' /etc/ssh/sshd_config \
  	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g' /etc/ssh/sshd_config \
  	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_dsa_key/HostKey \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config \
  	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g' /etc/ssh/sshd_config \
  	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g' /etc/ssh/sshd_config \
  	&& /usr/bin/ssh-keygen -A \
  	&& ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

COPY /src/nginx.conf /etc/nginx/nginx.conf

WORKDIR /var/www/html
COPY /src/index.html /var/www/html

COPY /src/ser.pem /etc/nginx/ssl/ser.pem
COPY /src/ser.key /etc/nginx/ssl/ser.key

EXPOSE 80 443 22

CMD /usr/sbin/sshd; /usr/sbin/nginx -g 'daemon off;'