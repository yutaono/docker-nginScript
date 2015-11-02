# Dockerfile for nginScript in Action

[Launching nginScript and Looking Ahead - NGINX](https://www.nginx.com/blog/launching-nginscript-and-looking-ahead/)

## USAGE

```
docker build -t yutaono/nginscript .
docker run -v `pwd`/nginx.conf:/etc/nginx/nginx.conf:ro -p 80:8080 -d yutaono/nginscript
curl $(docker-machine ip YOUR_DOCKER_MACHINE_NAME)
> Hello, World!
```
