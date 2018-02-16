# c9+php
FROM z3cka/c9:stretch
MAINTAINER Casey Grzecka <c@sey.gr>

RUN apt update
RUN apt install -y php7.0 php7.0-dev php-pear autoconf automake curl libcurl3-openssl-dev build-essential libxslt1-dev re2c libxml2 libxml2-dev php7.0-cli php7.0-curl bison libbz2-dev libreadline-dev
RUN apt install -y libfreetype6 libfreetype6-dev libjpeg-dev libgd-dev libgd3 libxpm4 libltdl7 libltdl-dev
RUN apt install -y libssl-dev openssl
RUN apt install -y gettext libgettextpo-dev libgettextpo0
RUN apt install -y libicu-dev
RUN apt install -y libmhash-dev libmhash2
RUN apt install -y libmcrypt-dev libmcrypt4

RUN curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew && \
    chmod +x phpbrew && \
    mv phpbrew /usr/bin/phpbrew

RUN phpbrew init && echo "[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc" >> /root/.bashrc

RUN mkdir /root/.phpbrew/bin
RUN phpbrew app get composer
RUN ln -s /root/.phpbrew/bin/composer /usr/local/bin/composer

RUN pecl install xdebug
RUN echo "zend_extension=/usr/lib/php/20151012/xdebug.so" >> /etc/php/7.0/mods-available/xdebug.init
RUN echo "xdebug.remote_enable=1" >> /etc/php/7.0/mods-available/xdebug.init
RUN ln -s /etc/php/7.0/mods-available/xdebug.init /etc/php/7.0/cli/conf.d/30-xdebug.ini

EXPOSE 80
EXPOSE 8080
