# Use a imagem base do Ubuntu
FROM ubuntu:20.04

# Atualize o sistema e instale as dependências necessárias
RUN apt-get update && apt-get install -y \
    wget \
    net-tools \
&& rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Copie o arquivo de instalação do XAMPP do diretório atual para o diretório de trabalho do Docker
COPY xampp-linux-x64-8.0.30-0-installer.run /xampp-installer.run

# Dê permissão de execução ao arquivo de instalação
RUN chmod +x /xampp-installer.run

# Execute o instalador do XAMPP
RUN /xampp-installer.run --mode unattended

# Remova o arquivo de instalação
RUN rm /xampp-installer.run

# Baixe e instale o Composer
RUN wget https://getcomposer.org/download/2.2.6/composer.phar -O /usr/local/bin/composer && chmod +x /usr/local/bin/composer

# Instale o Zsh
RUN apt-get update && apt-get install -y zsh \
    && apt-get clean

# Defina o Zsh como shell padrão para o usuário root
RUN chsh -s /usr/bin/zsh root

# Exponha as portas do Apache e MySQL
EXPOSE 80 443 3306

# Defina o diretório de trabalho para /var/www/html
WORKDIR /var/www/html

# Inicie o Apache e o MySQL quando o contêiner for iniciado
CMD ["/bin/zsh"]