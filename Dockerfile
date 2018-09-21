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

# ---------- DEBUT --------------

# Installattion des dependances
RUN apt-get update; apt-get install -y libopencv-dev libpcl-dev libgdal-dev libgsl-dev
RUN mkdir -p /home/run/user/1000

ENV XDG_RUNTIME_DIR=/home/run/user/1000

# Ajoute le repertoire computree
ADD computree_release.tar.xz /usr/share
RUN chmod +x /usr/share/computree_release/computreebatch.sh

# Autorun x11vnc
#CMD ["cd /usr/share/computree_release/"]

# ---------- FIN --------------
#
# Nettoie les APT
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
