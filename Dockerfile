FROM registry.access.redhat.com/rhel7:latest
#FROM base-centos7:latest

# the latest download link is at
# http://nxlog.org/products/nxlog-community-edition/download

RUN set -x \
  && yum -y install socat gunzip tar \
  && yum -y groupinstall 'Development Tools' \
  && mkdir /package && cd /package \
  && curl -sSO http://smarden.org/socklog/socklog-2.1.0.tar.gz \
  && tar xfvz socklog-2.1.0.tar.gz \
  && rm socklog-2.1.0.tar.gz \
  && cd admin/socklog-2.1.0 \
  && package/install \
  && yum -y autoremove gunzip tar \
  && yum -y groupremove 'Development Tools' \
  && yum -y clean all


#CMD ["/bin/sh"]
CMD ["/bin/sh","-c","while true; do echo hello world; sleep 30; done"]
