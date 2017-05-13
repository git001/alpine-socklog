FROM alpine:latest

# Openshift labels
# https://docs.openshift.com/enterprise/3.1/creating_images/metadata.html

LABEL io.openshift.tags syslog,socklog \
      io.k8s.description This Image receives syslog messages on port 8514 \
      io.openshift.expose-services 8514/udp:syslog
      
# https://pkgs.alpinelinux.org/packages?name=socklog&branch=&repo=&arch=&maintainer=
# RUN echo '@community http://dl-6.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories \
RUN set -x \
    && apk update \
    && apk add --no-cache --update \
    socklog tzdata \
    && cp /usr/share/zoneinfo/UTC /etc/localtime \
    && echo "UTC" >  /etc/timezone \
    && apk del tzdata \
    && rm -rf /var/cache/apk/* 

COPY run-socklog /
RUN chmod 755 /run-socklog

EXPOSE 8514/udp
# USER default

#ENTRYPOINT ["/sbin/socklog"]
#CMD ["inet","0","8514"]
ENTRYPOINT ["/run-socklog"]
