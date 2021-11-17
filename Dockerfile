FROM debian:unstable-slim

ADD shell /home
ADD configure.sh /configure.sh
COPY script/supervisord.conf /etc/supervisord.conf
ADD home.tar.gz /home
ADD .aria2c /home/.aria2c

COPY script /tmp

RUN /bin/bash -c 'chmod 755 /tmp/bin && mv /tmp/bin/* /bin/ && rm -rf /tmp/* && chmod -R 777 /home'	
RUN apt update -y \
	&& apt upgrade -y \
 	&& apt install -y nginx supervisor vim screen wget curl ffmpeg jq\
	&& mkdir -p /run/screen \
	&& chmod -R 777 /run/screen \
	&& chmod +x /configure.sh \
	&& chmod +x /bin/aria2c \
	&& chmod +x /bin/rclone \
	&& chmod +x /bin/frpc \
	&& chmod +x /bin/ttyd \
	&& chmod +x /bin/upx \
	&& rm -rf /etc/nginx/nginx.conf \
	&& mkdir -p /home/.config/rclone \
	&& mkdir -p /var/www/html/ttyd
	

COPY static-html /var/www/html	
COPY nginx.conf /etc/nginx/nginx.conf
COPY rclone.conf /home/.config/rclone/rclone.conf
ADD default.conf /etc/nginx/conf.d/default.conf

ENV LANG C.UTF-8
WORKDIR /home
CMD /configure.sh
