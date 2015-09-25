FROM ubuntu
MAINTAINER YUTA ONO <vrf.ced@gmail.com>

RUN apt-get update && \
    apt-get install -y --force-yes \
                       libssl0.9.8 \
                       curl \
                       build-essential \
                       mercurial \
                       libpcre3 \ 
                       libpcre3-dev \
                       zlib1g-dev

RUN curl -O http://nginx.org/download/nginx-1.9.4.tar.gz && \
    tar -xzvf nginx-1.9.4.tar.gz && \
    hg clone http://hg.nginx.org/njs && \
    cd nginx-1.9.4 && \
    ./configure \
      --user=nginx \
      --with-debug \
      --group=nginx \
      --prefix=/usr/share/nginx \
      --sbin-path=/usr/sbin/nginx \
      --conf-path=/etc/nginx/nginx.conf \
      --pid-path=/run/nginx.pid \
      --lock-path=/run/lock/subsys/nginx \
      --error-log-path=/var/log/nginx/error.log \
      --http-log-path=/var/log/nginx/access.log \
      --add-module=../njs/nginx && \ 
    make && \ 
    make install

RUN groupadd nginx
RUN useradd -g nginx nginx
RUN usermod -s /bin/false nginx

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

