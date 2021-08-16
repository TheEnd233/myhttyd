FROM debian:unstable-slim

ADD shell /home
ADD configure.sh /configure.sh
COPY script/supervisord.conf /etc/supervisord.conf
ADD home.tar.gz /home
COPY script /tmp
RUN /bin/bash -c 'chmod 755 /tmp/bin && mv /tmp/bin/* /bin/ && rm -rf /tmp/* '	
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y nginx supervisor vim screen wget curl ffmpeg
RUN mkdir -p /run/screen
RUN chmod -R 777 /run/screen
RUN chmod +x /configure.sh
RUN chmod +x /bin/aria2c
RUN chmod +x /bin/rclone
RUN chmod +x /bin/frpc
RUN chmod +x /bin/ttyd
RUN chmod +x /bin/upx
RUN rm -rf /etc/nginx/nginx.conf
RUN mkdir -p /var/www/html/ttyd
	
#&& mkdir -p /home/.config/rclone
COPY static-html /var/www/html	
COPY nginx.conf /etc/nginx/nginx.conf
#COPY rclone.conf /home/.config/rclone/rclone.conf
ADD default.conf /etc/nginx/conf.d/default.conf

ENV LANG C.UTF-8
WORKDIR /home
CMD /configure.sh
