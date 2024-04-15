# Use a imagem oficial do PHP com Apache
FROM php:7.4-apache

# Instalar extensões necessárias
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Copiar o código fonte do Laravel para o container
COPY todolist-back /var/www/html

# Configurar o diretório público como raiz do Apache
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Habilitar mod_rewrite para rotas do Laravel
RUN a2enmod rewrite

# Configurar permissões
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

# O comando padrão para iniciar o servidor Apache
CMD ["apache2-foreground"]