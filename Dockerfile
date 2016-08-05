FROM ejspr5tr4/perl-base:latest

MAINTAINER Eugene O'Brien <e.obrien@sportstg.com>

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    apache2 \
    libapache2-mod-perl2

RUN rm -rf /var/lib/apt/lists/*

