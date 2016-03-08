# Syslog docker image

Due to the fact that most common syslog server (rsyslog, syslog-ng,...) was not designed for docker or paas I decided to create a small (~5 MB) image which receives sylsog messages and write it out to stdout.

This image is based on [Alpine Linux][ac11addb] and [socklog][022939b2]

  [ac11addb]: https://www.alpinelinux.org/ "Alpine Linux"
  [022939b2]: http://smarden.org/socklog/socklog.8.html "socklog"

## docker steps

git clone ...  
cd ...  
docker build --rm -t mysocklog .  
docker run -it --rm --net host mysocklog  

## openshift

oc new-project syslogger  
oc new-app https://github.com/git001/alpine-socklog.git  
