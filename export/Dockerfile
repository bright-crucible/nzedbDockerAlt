FROM fedora:31

RUN groupadd -g 1001 export \
    && useradd -u 1001 -g 1001 export \
    && ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
    && dnf -y install \
        https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
    && dnf -y groupinstall \
        "Development Tools" \
        "Development Libraries" \
    && dnf -y install \
        unrar \
        yasm \
        lame \
        php-devel \
        php \
        php-pear \
        php-gd \
        php-mysqlnd \
        php-curl \
        git \
        p7zip \
        php-mbstring \
        php-mcrypt \
        php-pecl-imagick \
        mediainfo \
        mediainfo-gui \
        gcc \
        re2c \
        php-devel \
        pcre-devel \
        autoconf \
        automake \
        wget \
        bzip2 \
        composer \
        par2cmdline \
        libevent-devel \
        ncurses-devel \
        perl-Text-Template \
        iputils \
        xz \
    && dnf clean all
#==============================================
COPY export.sh /home/export
RUN mkdir -p /home/export/export \
    && chown export:export /home/export/export \
    && chown export:export /home/export/export.sh
USER export
WORKDIR /home/export
RUN git clone https://github.com/nZEDb/nZEDb.git
WORKDIR /home/export/nZEDb
RUN composer install --prefer-source
WORKDIR /home/export
RUN tar c nZEDb | xz -T 0 > nZEDb.tar.xz \
    && rm -rf nZEDb
#RUN chmod -R 755 app/libraries \
#    && chmod -R 775 app/resources \
#    && chmod -R 775 libraries \
#    && chmod -R 775 www \
#    && chmod +x ./zed
#RUN mkdir -p /var/www/nZEDb/resources/tmp \
#    && chgrp apache /var/www/nZEDb/resources/nzb \
#    && chgrp apache /var/www/nZEDb/resources/smarty/templates_c \
#    && chgrp -R apache /var/www/nZEDb/resources/covers \
#    && chgrp -R apache /var/www/nZEDb/resources/tmp \
#    && chgrp -R apache /var/www/nZEDb/configuration \
#    && chgrp -R apache /var/www/nZEDb/_install
#==============================================
#RUN mysql_tzinfo_to_sql /usr/share/zoneinfo \
#    | mysql --protocol=SOCKET \
#        --socket/var/run/mysqld/mysql.sock
#==============================================
CMD ["tail", "-f", "/dev/null"]
