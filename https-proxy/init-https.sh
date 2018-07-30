#!/bin/sh

echo "Start nginx ..."
/usr/sbin/nginx -c /etc/nginx/nginx.conf

# if first launch, start asking certs
if [ ! -d "/etc/letsencrypt/archive/$domain_name" ]; then
  echo "Retrieve certs ..."
  certbot certonly --webroot -w /var/www/default -d $domain_name -d www.$domain_name --rsa-key-size 4096 --quiet --agree-tos --email $email
fi

# if first launch, start creation of dhparam
if [ ! -f "/etc/nginx/ssl/$domain_name/dhparam$dhparam.pem" ]; then
  echo "Creation of dhparam.pem"
  cd /etc/nginx/ssl/$domain_name/ && openssl dhparam -out dhparam$dhparam.pem $dhparam
fi

echo "Force to use https"
cp /default-https.conf /etc/nginx/conf.d/default.conf

echo "Restart nginx ..."
/usr/sbin/nginx -s stop && \
  /usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;"
