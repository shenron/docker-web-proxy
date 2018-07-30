FROM nginx:stable-alpine

MAINTAINER Thomas CASTELLY <thomas@tcy.io>

ONBUILD ARG domain_name
ONBUILD ARG api_service
ONBUILD ARG static_service

COPY /nginx/conf.d/default.conf /etc/nginx/conf.d/
COPY /nginx/conf.d/default-http.conf /
ONBUILD RUN sed -i "s/server_name \$domain_name;/server_name $domain_name;/" /etc/nginx/conf.d/default.conf &&\
  sed -i "s/\$domain_name/$domain_name/" /default-http.conf && \
  sed -i "s/www.\$domain_name/www.$domain_name/" /default-http.conf &&\
  sed -i "s/proxy_pass http:\/\/\$api_service;/proxy_pass http:\/\/$api_service;/" /default-http.conf &&\
  sed -i "s/proxy_pass http:\/\/\$static_service;/proxy_pass http:\/\/$static_service;/" /default-http.conf

ONBUILD RUN mkdir -p /var/www/default && \
  cp /usr/share/nginx/html/* /var/www/default/

ONBUILD RUN mv /default-http.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
