FROM debian:latest
MAINTAINER weirich@elexis.ch
RUN echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Debian_8.0/ /' >> /etc/apt/sources.list.d/owncloud-client.list && \
apt-get -y update && apt-get install -y owncloud-client

ADD startup.sh /startup.sh
RUN chmod +x /startup.sh

# Cleanup
RUN apt-get clean
RUN rm -rf /usr/share/doc /usr/share/man /usr/share/locale /usr/share/info /usr/share/lintian

ENTRYPOINT [ "/startup.sh" ]

