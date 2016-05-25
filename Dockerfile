FROM gliderlabs/alpine:latest

# Openshift labels
# https://docs.openshift.com/enterprise/3.1/creating_images/metadata.html

LABEL io.openshift.tags syslog,socklog \
      io.k8s.description This Image receives syslog messages on port 8514 \
      io.openshift.expose-services 8514/udp:syslog
    
RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk add --no-cache --update \
    socklog@testing tzdata \
    && cp /usr/share/zoneinfo/UTC /etc/localtime \
    && echo "UTC" >  /etc/timezone \
    && apk del tzdata \
    && rm -rf /var/cache/apk/*

EXPOSE 8514/udp
USER default

ENTRYPOINT ["/sbin/socklog"]

# CMD ["inet","0","8514"]
CMD ["inet","0",${SYSLOG_PORT}]
