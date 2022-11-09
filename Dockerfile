FROM centos
MAINTAINER Charles Bouley <info@redpensecurity.com>
LABEL description ="EX180 Lesson 9 Laboratory"

COPY ./centos.repo /etc/yum.repos.d/

# Install nmap and httpd software
RUN     yum --assumeyes update && \
        yum --assumeyes install bash httpd nmap iproute && \
        yum clean all && \
        echo "RedPen EX180 Lesson 9 Laboratory" > /var/www/html/index.html

EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
