# Usar uma imagem oficial do PHP com suporte ao PostgreSQL
FROM php:8.1-cli

# Instalar extensões PHP necessárias para o PostgreSQL
RUN apt-get update \
    && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Instalar o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o código da aplicação
COPY . .

# Executar o Composer para instalar as dependências
RUN composer install

# Definir o comando padrão
CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "8080"]
