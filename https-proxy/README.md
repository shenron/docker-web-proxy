Use HTTPS proxy to serve REST api, statics 

```
version: '3.3'
services:
  https-proxy:
    build:
      # ./https-proxy/Dockerfile
      # FROM shenron/https-proxy
      context: ./https-proxy/
      args:
        domain_name: "real-domain-name.com"
        api_service: "api:3000"
        static_service: "static:80"
        email: "mail@real-domain-name.com"
        dhparam: "2048"
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - letsencrypt-data:/etc/letsencrypt/archive/
      - nginx-ssl-data:/etc/nginx/ssl/
    depends_on:
      - api
      - static

volumes:
  letsencrypt-data:
  nginx-ssl-data:
```
