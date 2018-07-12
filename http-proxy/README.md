Use HTTP proxy to serve REST api, statics 

```
version: '3.3'
services:
  http-proxy:
    image: shenron/http-proxy
    build:
      args:
        domain_name: "localhost"
    ports:
      - "8080:80"
    depends_on:
      - other-service
```
