FROM debian:stretch
MAINTAINER Corey Deli

EXPOSE 3333 80

ENV GOPHISH_VERSION 0.7.1

RUN apt-get update && \
apt-get install --no-install-recommends -y \
unzip \
ca-certificates \
wget && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /opt/gophish && \
wget -nv https://github.com/gophish/gophish/releases/download/$GOPHISH_VERSION/gophish-v$GOPHISH_VERSION-linux-64bit.zip && \
unzip gophish-v$GOPHISH_VERSION-linux-64bit.zip -d /opt/gophish && \
rm -f gophish-v$GOPHISH_VERSION-linux-64bit.zip && \
chmod +x /opt/gophish/gophish

WORKDIR /opt/gophish/

ADD files/config.tmpl /opt/gophish/
ADD files/entrypoint.sh /opt/gophish/

ENTRYPOINT ["/opt/gophish/entrypoint.sh"]