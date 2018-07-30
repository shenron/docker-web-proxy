FROM nginx:stable-alpine

MAINTAINER Thomas CASTELLY <thomas@tcy.io>

ONBUILD ARG domain_name
ONBUILD ARG service_name
ONBUILD ARG service_internal_port

COPY /nginx/conf.d/default.conf /etc/nginx/conf.d/
COPY /nginx/conf.d/default-http.conf /
ONBUILD RUN sed -i "s/server_name \$domain_name;/server_name $domain_name;/" /etc/nginx/conf.d/default.conf &&\
  sed -i "s/\$domain_name/$domain_name/" /default-http.conf && \
  sed -i "s/www.\$domain_name/www.$domain_name/" /default-http.conf &&\
  sed -i "s/proxy_pass http:\/\/\$service_name:\$service_internal_port;/proxy_pass http:\/\/$service_name:$service_internal_port;/" /default-http.conf

ONBUILD RUN mkdir -p /var/www/default && \
  cp /usr/share/nginx/html/* /var/www/default/

ONBUILD RUN mv /default-http.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
