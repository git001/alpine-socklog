#!/bin/sh

set -x

if [ -n "${UNIX}" ];
then  
  exec /sbin/socklog unix ${UNIX}
else
  exec /sbin/socklog inet 0 ${SYSLOG_PORT}
fi
