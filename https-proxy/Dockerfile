FROM nginx:stable-alpine

MAINTAINER Thomas CASTELLY <thomas@tcy.io>

ARG domain_name
ARG service_name
ARG service_internal_port
ARG email
ARG dhparam

RUN apk update && \
  apk add certbot openssl

COPY /nginx/conf.d/default.conf /etc/nginx/conf.d/
COPY /nginx/conf.d/default-https.conf /
RUN sed -i "s/server_name \$domain_name;/server_name $domain_name;/" /etc/nginx/conf.d/default.conf &&\
  sed -i "s/\$domain_name/$domain_name/" /default-https.conf && \
  sed -i "s/www.\$domain_name/www.$domain_name/" /default-https.conf &&\
  sed -i "s/\$dhparam/$dhparam/" /default-https.conf &&\
  sed -i "s/proxy_pass http:\/\/\$service_name:\$service_internal_port;/proxy_pass http:\/\/$service_name:$service_internal_port;/" /default-https.conf

RUN mkdir /etc/nginx/ssl &&\
  mkdir -p /var/www/default && \
  cp /usr/share/nginx/html/* /var/www/default/

COPY /init-https.sh /
RUN sed -i "s/\$domain_name/$domain_name/" /init-https.sh &&\
  sed -i "s/www.\$domain_name/www.$domain_name/" /init-https.sh &&\
  sed -i "s/\$email/$email/" /init-https.sh &&\
  sed -i "s/\$dhparam\.pem/$dhparam.pem/" /init-https.sh &&\
  sed -i "s/\$dhparam/$dhparam/" /init-https.sh

CMD ["/init-https.sh"]

EXPOSE 80 443
