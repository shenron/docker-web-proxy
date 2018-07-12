Use HTTP proxy to serve REST api, statics 

```
version: '3.3'
services:
  http-proxy:
    # ./http-proxy/Dockerfile
    # FROM shenron/http-proxy
    context: ./http-proxy/
    build:
      args:
        domain_name: "localhost"
    ports:
      - "8080:80"
    depends_on:
      - other-service
```
