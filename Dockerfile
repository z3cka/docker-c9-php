FROM z3cka/c9
MAINTAINER Casey Grzecka <c@sey.gr>

RUN apt update
RUN apt install -y php5 php5-dev php5-curl php-pear autoconf automake curl libcurl3-openssl-dev build-essential libxslt1-dev re2c libxml2 libxml2-dev php5-cli php5-curl bison libbz2-dev libreadline-dev
RUN apt install -y libfreetype6 libfreetype6-dev libpng12-0 libpng12-dev libjpeg-dev libgd-dev libgd3 libxpm4 libltdl7 libltdl-dev
RUN apt install -y libssl-dev openssl
RUN apt install -y gettext libgettextpo-dev libgettextpo0
RUN apt install -y libicu-dev
RUN apt install -y libmhash-dev libmhash2
RUN apt install -y libmcrypt-dev libmcrypt4

RUN curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew && \
    chmod +x phpbrew && \
    mv phpbrew /usr/bin/phpbrew

RUN phpbrew init && echo "[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc" >> /root/.bashrc

RUN phpbrew app get composer

RUN pecl install xdebug
# TODO: add xdebug.ini and link to it where php is being executed from cli