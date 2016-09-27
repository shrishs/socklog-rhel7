# rhel7-socklog

This repository creates a syslog listener on the specified UDP port `SYSLOG_PORT`

The listener is based on socklog http://smarden.org/socklog/socklog.8.html

You can run

```
oc new-app https://gitlab.com/aleks001/rhel7-socklog.git
```

to create the image/imagestream


# what this repo do?

This runs the syslog receiver from socklog on port `SYSLOG_PORT` and **ANY** 
interfaces and writes the incomming messages to stdout.

The `run-socklog.sh` is also able to listen on unix domain stream socket when 
you set the env var `UNIX` to any value.

You can't use this mode in OCP when you run in random user mode without 
privileged sa

# Attention!

Due to the fact that the stdout is written in a docker-json-log you should 
restart this container acording to your log volume.

# how to use it

You can use in OCP, OpenShift and Kubernetes the env vars from the project.


