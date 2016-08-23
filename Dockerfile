FROM registry.access.redhat.com/rhel7:latest
#FROM base-centos7:latest

# the latest download link is at
# http://nxlog.org/products/nxlog-community-edition/download

RUN set -x \
  && yum -y install socat http://nxlog.org/system/files/products/files/1/nxlog-ce-2.9.1716-1_rhel7.x86_64.rpm


#CMD ["/bin/sh"]
CMD ["/bin/sh","-c","while true; do echo hello world; sleep 30; done"]
