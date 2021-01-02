FROM ubuntu:20.04

ENV timezone=America/Sao_Paulo

RUN apt-get update && \
    ln -snf /usr/share/zoneinfo/${timezone} /etc/localtime && echo ${timezone} > /etc/timezone && \
    apt-get install -y apache2 && \ 
    apt-get install -y php && \
    apt-get install -y php-xdebug && \
    apt-get install -y php7.4-mysql && \
    apt-get install -y git && \
    apt-get install -y php-curl && \
    apt-get install -y php-dom && \
    apt-get install -y php-gd && \
    apt-get install -y php-mbstring && \
    apt-get install -y php-simplexml && \
    apt-get install -y php-xmlreader && \
    apt-get install -y php-xmlwriter && \
    apt-get install -y php-zip && \
    apt-get install -y nano -y && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && rm composer-setup.php && mv composer.phar /usr/local/bin/composer && chmod a+x /usr/local/bin/composer

EXPOSE 80

WORKDIR /var/www/html

ENTRYPOINT /etc/init.d/apache2 start && /bin/bash

CMD ["true"]