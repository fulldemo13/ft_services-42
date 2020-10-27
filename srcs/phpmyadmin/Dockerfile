# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fulldemo <fulldemo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/04 12:40:45 by fulldemo          #+#    #+#              #
#    Updated: 2020/10/21 19:13:28 by fulldemo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update &&\
	apk add openrc &&\
	apk add wget &&\
	mkdir www/ &&\
	apk add php php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

# Install PhpMyAdmin
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz &&\
	tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz &&\
	mv phpMyAdmin-5.0.2-all-languages /www &&\
	rm phpMyAdmin-5.0.2-all-languages.tar.gz

COPY config.inc.php		/www/phpMyAdmin-5.0.2-all-languages/

EXPOSE 5000

CMD php -S 0.0.0.0:5000 -t /www/phpMyAdmin-5.0.2-all-languages