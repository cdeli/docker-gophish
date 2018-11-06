FROM debian:jessie
MAINTAINER Corey Deli <Corey.Deli@outlook.com>

EXPOSE 3333 80

#ENV GOPHISH_VERSION 0.7.1

RUN apt-get update && \
apt-get install --no-install-recommends -y \
unzip \
ca-certificates \
wget && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /opt/gophish && \
wget -nv https://github.com/gophish/gophish/releases/download/0.7.1/gophish-v0.7.1-linux-64bit.zip && \
unzip gophish-v0.7.1-linux-64bit.zip -d /opt/gophish && \
rm -f gophish-v0.7.1-linux-64bit.zip && \
chmod +x /opt/gophish/gophish

WORKDIR /opt/gophish/

#ENTRYPOINT ["/opt/gophish/entrypoint.sh"]