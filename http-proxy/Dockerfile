FROM nginx:stable-alpine

MAINTAINER Thomas CASTELLY <thomas@tcy.io>

ARG domain_name

COPY /nginx/conf.d/default.conf /etc/nginx/conf.d/
COPY /nginx/conf.d/default-http.conf /
RUN sed -i "s/server_name \$domain_name;/server_name $domain_name;/" /etc/nginx/conf.d/default.conf &&\
  sed -i "s/\$domain_name/$domain_name/" /default-http.conf && \
  sed -i "s/www.\$domain_name/www.$domain_name/" /default-http.conf &&\
  sed -i "s/\$dhparam/$dhparam/" /default-http.conf

RUN mkdir -p /var/www/default && \
  cp /usr/share/nginx/html/* /var/www/default/

RUN mv /default-http.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
