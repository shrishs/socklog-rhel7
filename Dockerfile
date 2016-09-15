FROM registry.access.redhat.com/rhel7:latest
#FROM base-centos7:latest

# added --skip-broken  because of
# --> Running transaction check
# ---> Package hwdata.x86_64 0:0.252-8.1.el7 will be installed
# ---> Package systemd-sysv.x86_64 0:219-19.el7_2.12 will be installed
# --> Processing Dependency: systemd = 219-19.el7_2.12 for package: systemd-sysv-219-19.el7_2.12.x86_64
# --> Finished Dependency Resolution
# Error: Package: systemd-sysv-219-19.el7_2.12.x86_64 (rhel-7-server-rpms)
#            Requires: systemd = 219-19.el7_2.12
#            Installed: systemd-219-19.el7_2.13.x86_64 (@anaconda/7.2)
#                   systemd = 219-19.el7_2.13

RUN set -x \
  && yum -y update \
  && yum -y --skip-broken install socat gunzip tar \
  && yum -y --skip-broken  groupinstall 'Development Tools' --setopt=group_package_types=mandatory,default,optional \
  && mkdir /package && cd /package \
  && curl -sSO http://smarden.org/socklog/socklog-2.1.0.tar.gz \
  && tar xfvz socklog-2.1.0.tar.gz \
  && rm socklog-2.1.0.tar.gz \
  && cd admin/socklog-2.1.0 \
  && package/install \
  && yum -y autoremove gunzip tar \
  && yum -y groupremove 'Development Tools' \
  && yum -y clean all

ENV SYSLOG_PORT=8514
COPY run-socklog.sh /
RUN chmod 755 /run-socklog.sh
EXPOSE 8514/udp

USER 1001

ENTRYPOINT ["/run-socklog.sh"]
#CMD ["/bin/sh"]
#CMD ["/bin/sh","-c","while true; do echo hello world; sleep 30; done"]
