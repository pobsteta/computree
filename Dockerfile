# Computree stack
#
# This image includes the following tools
# - Computree
#
# Version 5.0

FROM ubuntu:18.04
MAINTAINER Pascal Obstétar<pascal.obstetar@gmail.com>

RUN  export DEBIAN_FRONTEND=noninteractive
ENV  DEBIAN_FRONTEND noninteractive
RUN  dpkg-divert --local --rename --add /sbin/initctl

RUN apt-get -y update; apt-get -y install gnupg2 wget ca-certificates rpl pwgen
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# ---------- DEBUT --------------

# Installattion des dependances
RUN apt-get update; apt-get install -y libopencv-dev libpcl-dev libgdal-dev libgsl-dev

# Ajoute le repertoire computree
ADD computree_release.tar.xz /usr/share
RUN chmod +x /usr/share/computree_release/computreebatch.sh

# ---------- FIN --------------
#
# Nettoie les APT
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
