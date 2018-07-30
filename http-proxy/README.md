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
        service_name: "other-service"
        service_internal_port: "8181"
    ports:
      - "8080:80"
    depends_on:
      - other-service
```
