FROM debian:buster

#PACKAGES
RUN apt update -y
RUN apt install nginx systemd openssl -y

#OPENSSL
RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=75/O=42/CN=lbastian.42.fr" -addext "subjectAltName=DNS:lbastian.42.fr" -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt

#NGINX
RUN systemctl enable nginx
RUN  /etc/init.d/nginx start
COPY default.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
