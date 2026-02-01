FROM rockylinux:9

ENV TZ=UTC

RUN dnf -y update && \
    dnf -y install \
    dnf-utils \
    epel-release \
    git \
    unzip \
    && dnf clean all

RUN dnf -y install https://rpms.remirepo.net/enterprise/remi-release-9.rpm && \
    dnf -y module reset php && \
    dnf -y module enable php:remi-8.2

RUN dnf -y install \
    php \
    php-cli \
    php-mbstring \
    php-xml \
    php-pdo \
    php-json \
    php-openssl \
    php-tokenizer \
    && dnf clean all

RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin \
    --filename=composer

WORKDIR /var/www/html

COPY . .

RUN composer install --no-dev --optimize-autoloader

RUN chmod -R 775 storage bootstrap/cache

EXPOSE 8000

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
