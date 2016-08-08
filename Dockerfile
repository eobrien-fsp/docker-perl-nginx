FROM ejspr5tr4/perl-base:latest

MAINTAINER "Eugene O'Brien <e.obrien@sportstg.com>"

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    nginx \
    spawn-fcgi \
    fcgiwrap \
    libfcgi-perl \
    vim

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    supervisor

COPY supervisord.conf /etc/supervisor/supervisord.conf

COPY nginx.conf /etc/nginx/sites-available/default

RUN mkdir /var/run/supervisor/

#RUN rm -rf /var/lib/apt/lists/*

EXPOSE 80

VOLUME ["/var/www/"]

CMD ["/usr/bin/supervisord","--configuration=/etc/supervisor/supervisord.conf"]

#ENTRYPOINT ["/usr/sbin/apache2ctl","-D FOREGROUND"]

