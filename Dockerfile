FROM debian:latest
MAINTAINER weirich@elexis.ch

RUN apt-get update && apt-get install -y wget 
RUN wget http://download.opensuse.org/repositories/isv:ownCloud:desktop/Debian_8.0/Release.key 
RUN apt-key add - < Release.key  

RUN echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Debian_8.0/ /' >> /etc/apt/sources.list.d/owncloud-client.list
RUN apt-get -y update && apt-get install -y owncloud-client 

ADD startup.sh /startup.sh
RUN chmod +x /startup.sh

# Cleanup
RUN apt-get clean
RUN rm -rf /usr/share/doc /usr/share/man /usr/share/locale /usr/share/info /usr/share/lintian

ENTRYPOINT [ "/startup.sh" ]

