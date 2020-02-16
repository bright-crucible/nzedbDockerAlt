FROM fedora:31
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
    && dnf -y install \
        httpd \
        php-devel \
        php \
        php-pear \
        php-gd \
        php-mysqlnd \
        php-curl \
        php-mbstring \
        php-mcrypt \
        php-pecl-imagick \
        php-fpm \
        php-common \
        php-pecl-igbinary \
        php-pecl-redis5 \
        mod_ssl \
    && dnf clean all
COPY ssl.conf /etc/httpd/conf.d/ssl.conf
COPY nzedb.conf /etc/httpd/conf.d/nzedb.conf
COPY php.ini /etc/php.ini
CMD ["httpd", "-D", "FOREGROUND"]
