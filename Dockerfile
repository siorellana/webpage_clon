FROM centos

LABEL version=1.0

LABEL description="Imagen con httpd (apache) para ejecutar sitios estáticos"

RUN yum -y install httpd

WORKDIR /var/www/html/

COPY public .

CMD apachectl -DFOREGROUND