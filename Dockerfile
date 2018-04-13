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


RUN apt-get install -y apt-get install -y php php-bcmath php-bz2 php-cgi php-cli php-common  php-curl  php-dev  php-enchant  php-fpm  php-gd  php-gmp  php-imap  php-interbase  php-intl  php-json  php-ldap  php-mbstring  php-mcrypt  php-mysql  php-odbc  php-opcache  php-pgsql  php-phpdbg  php-pspell  php-readline  php-recode  php-snmp  php-soap  php-sqlite3  php-sybase  php-tidy  php-xml  php-xmlrpc  php-xsl  php-zip php-xdebug unzip build-essential libssl-dev git curl dos2unix
RUN apt-get clean

CMD [ "php" ]
