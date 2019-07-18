FROM centos:7.6.1810
MAINTAINER Michael Hatoum <michael@adaltas.com>

# docker build -t makayel/supervisor .
# docker run -d --name makayel makayel/supervisor
# docker exec -ti makayel /bin/bash

RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install python-setuptools python-setuptools-devel python-pip && \
    pip install --upgrade pip && \
    yum -y install wget tar bzip2 net-tools git && \
    easy_install supervisor && \
    /usr/bin/echo_supervisord_conf > /etc/supervisord.conf && \
    mkdir -p /etc/supervisor/conf.d/ && \
    mkdir -p /var/log/supervisor/ && \
    sed -i -e "s/^nodaemon=false/nodaemon=true/" /etc/supervisord.conf && \
    echo '' >> /etc/supervisord.conf && \
    echo '[include]' >> /etc/supervisord.conf && \
    echo 'files = /etc/supervisor/conf.d/*.conf' >> /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
