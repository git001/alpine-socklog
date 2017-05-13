#!/bin/sh

set -x

if [ -n "${UNIX}" ];
then  
  exec /usr/local/bin/socklog unix ${UNIX}
else
  exec /usr/local/bin/socklog inet 0 ${SYSLOG_PORT}
fi
