FROM fedora:31

ENV FFMPEG_VER 4.2.2
ENV ZEPHIR_VER 0.12.16
ENV PHP_YENC_VER 1.3.0
WORKDIR /opt
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
    && dnf -y install \
        https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
    && dnf -y groupinstall \
        "Development Tools" \
        "Development Libraries" \
    && dnf -y install \
        httpd \
        php-fpm \
        unrar \
        yasm \
        lame \
        php-devel \
        php \
        php-pear \
        php-gd \
        php-mysqlnd \
        php-curl \
        p7zip \
        php-mbstring \
        php-mcrypt \
        php-pecl-imagick \
        php-PHPMailer \
        mediainfo \
        mediainfo-gui \
        re2c \
        php-devel \
        wget \
        bzip2 \
        xz \
        composer \
        par2cmdline \
        libevent-devel \
        perl-Text-Template \
        php-pecl-igbinary \
        diffutils \
        php-pecl-redis5 \
        which \
        procps-ng \
        psmisc \
        screen \
        mod_ssl \
    && dnf clean all \
    && groupadd -g 1001 nzedb \
    && useradd -u 1001 -g 1001 nzedb \
    && usermod -a -G apache nzedb \
    && usermod -a -G nzedb apache \
    && mkdir -p /var/www/nZEDb \
    && chown nzedb:nzedb /var/www/nZEDb \
    && wget -O- https://github.com/tmux/tmux/releases/download/2.0/tmux-2.0.tar.gz \
    | tar xz \
    && cd tmux-2.0 \
    && ./configure \
    && make \
    && cp tmux /usr/local/bin/ \
    && cd .. \
    && rm -rf tmux-2.0

RUN wget -O- http://ffmpeg.org/releases/ffmpeg-${FFMPEG_VER}.tar.bz2 \
    | tar xj \
    && cd ffmpeg-${FFMPEG_VER} \
    && ./configure \
    && make -j12 \
    && make install \
    && cd .. \
    && rm -rf ffmpeg-${FFMPEG_VER}
#==============================================
RUN git clone git://github.com/phalcon/php-zephir-parser.git \
    && cd php-zephir-parser \
    && phpize \
    && ./configure \
    && make \
    && make install \
    && echo "[Zephir Parser]" >> /etc/php.ini \
    && echo "extension=zephir_parser.so" >> /etc/php.ini \
    && cd .. \
    && rm -rf php-zephir-parser \
    && wget -O /usr/local/bin/zephir https://github.com/phalcon/zephir/releases/download/${ZEPHIR_VER}/zephir.phar \
    && chmod 755 /usr/local/bin/zephir \
    && zephir help \
    && wget -O- https://github.com/niel/php-yenc/archive/v${PHP_YENC_VER}.tar.gz \
    | tar xz \
    && cd php-yenc-${PHP_YENC_VER} \
    && zephir build \
    && echo "extension=yenc.so" > /etc/php.d/50-yenc.ini \
    && cd .. \
    && rm -rf php-yenc-${PHP_YENC_VER}
#==============================================
COPY predb_import.sh /usr/local/bin
COPY php.ini /etc/php.ini
WORKDIR /var/www/nZEDb/misc/update/nix/tmux

CMD ["php-fpm", "--nodaemonize"]
