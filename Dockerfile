FROM gliderlabs/alpine:latest

RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk add --no-cache --update \
    socklog@testing \
    && rm -rf /var/cache/apk/*


ENTRYPOINT ["/sbin/socklog"]

#CMD ["inet","0","8514"]
CMD ["inet","0","8514"]
