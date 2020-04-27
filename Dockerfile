FROM cypress/base:10

RUN apt update -y && apt upgrade -y
RUN apt install apt-transport-https lsb-release ca-certificates
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
RUN apt update -y
RUN apt install -y php7.2 php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-mysql php7.2-zip php7.2-fpm php7.2-mbstring php7.2-curl php7.2-simplexml php7.2-gd unzip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt install -y apache2
