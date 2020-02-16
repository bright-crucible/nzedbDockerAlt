FROM mariadb:10.3

# To avoid mysql whining about this variable
ENV TERM dumb 

RUN apt-get update \
    && apt-get install -y wget \
    && ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && rm -rf /var/lib/apt/lists/*

ENV MYSQL_TUNER_VERSION 1.7.17
RUN wget -O /mysqltuner.tar.gz https://github.com/major/MySQLTuner-perl/archive/${MYSQL_TUNER_VERSION}.tar.gz \
    && cd / \
    && tar xzvf mysqltuner.tar.gz \
    && mv MySQLTuner-perl-${MYSQL_TUNER_VERSION} mysqltuner \
    && rm /mysqltuner.tar.gz \
    && chmod +x /mysqltuner/mysqltuner.pl

RUN usermod --uid 1001 mysql \
    && groupmod --gid 1001 mysql \
    && chown -R mysql:mysql /var/lib/mysql
COPY nzedb.cnf /etc/mysql/conf.d
#COPY users-table.sql /docker-entrypoint-initdb.d
