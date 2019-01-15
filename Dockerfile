FROM debian:jessie-slim
RUN apt-get update && apt-get install wget apt-transport-https lsb-release ca-certificates apache2 -y

RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

RUN apt update 

RUN wget http://phpdox.de/releases/phpdox.phar \
    && wget https://phar.phpunit.de/phpcpd.phar \
    && wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar \
    && wget https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar \
    && wget http://static.pdepend.org/php/latest/pdepend.phar \
    && wget https://phar.phpunit.de/phploc.phar \
    && wget https://phar.phpunit.de/phpunit.phar \
    && wget https://getcomposer.org/composer.phar \
    && wget -c http://static.phpmd.org/php/latest/phpmd.phar

RUN chmod +x phpdox.phar phpcpd.phar phpcs.phar pdepend.phar phploc.phar phpunit.phar composer.phar phpmd.phar

RUN mv phpdox.phar /usr/local/bin/phpdox \
    && mv phpcpd.phar /usr/local/bin/phpcpd \
    && mv phpcs.phar /usr/local/bin/phpcs \
    && mv phpcbf.phar /usr/local/bin/phpcbf \
    && mv pdepend.phar /usr/local/bin/pdepend \
    && mv phploc.phar  /usr/local/bin/phploc \
    && mv phpunit.phar /usr/local/bin/phpunit \
    && mv composer.phar /usr/local/bin/composer \
    && mv phpmd.phar /usr/local/bin/phpmd


RUN apt-get install -y php7.1 php7.1-bcmath php7.1-bz2 php7.1-cli php7.1-common  php7.1-curl  php7.1-dev  php7.1-gmp  php7.1-intl  php7.1-json  php7.1-mbstring  php7.1-mcrypt  php7.1-mysql  php7.1-opcache  php7.1-pgsql  php7.1-readline  php7.1-soap  php7.1-sqlite3  php7.1-xml  php7.1-xmlrpc  php7.1-xsl  php7.1-zip php-xdebug unzip build-essential libssl-dev git curl dos2unix
RUN apt-get clean

CMD [ "php" ]
