# Use Base Debian Buster slim image
FROM debian:buster-slim

# Author of this Dockerfile
MAINTAINER Marko Punnar "marko[AT]aretaja.org"

# Update and install tacacs+ sssd
RUN apt-get -qq update && \
 DEBIAN_FRONTEND=noninteractive apt-get -yqq dist-upgrade && \
 DEBIAN_FRONTEND=noninteractive apt-get -yqq install sssd tacacs+ && \
 DEBIAN_FRONTEND=noninteractive apt-get -yqq autoremove && \
 apt-get -qq clean && \
 rm -rf /var/lib/apt/lists/*
ADD files/sssd_from_host /etc/pam.d/

# Default env variables
ENV CONFIG_PATH "/etc/tacacs+"
ENV LOGFILE "/var/log/tac_plus.log"
ENV CONFIG "${CONFIG_PATH}/tac_plus.conf"
ENV DEBUGLVL 0
ENV FILTERREGEX ""

# Start script
WORKDIR /home/tac_plus
RUN mkdir "bin"
ADD --chown=root:root files/start.sh bin/
RUN chmod ug+x bin/start.sh

EXPOSE 49/tcp

ENTRYPOINT [ "./bin/start.sh" ]
