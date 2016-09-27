# rhel7-socklog

This repository creates a syslog listener on the specified UDP port **SYSLOG_PORT**

The listener is based on socklog http://smarden.org/socklog/socklog.8.html

You can run

```
oc new-app https://gitlab.com/aleks001/rhel7-socklog.git
```

to create the image/imagestream