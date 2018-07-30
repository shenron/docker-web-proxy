Use HTTP proxy to serve REST api, statics 

```
version: '3.3'
services:
  http-proxy:
    build:
      # ./http-proxy/Dockerfile
      # FROM shenron/http-proxy
      context: ./http-proxy/
      args:
        domain_name: "localhost"
        api_service: "api:3000"
        static_service: "static:80"
    ports:
      - "8080:80"
    depends_on:
      - api
      - static
```
