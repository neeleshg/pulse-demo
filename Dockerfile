FROM ubuntu:16.04
MAINTAINER NeeleshGurjar <neelesh.gurjar@gslab.com>

RUN \
  apt-get update && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]
COPY files/index.html /var/www/html/

WORKDIR /etc/nginx

CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
