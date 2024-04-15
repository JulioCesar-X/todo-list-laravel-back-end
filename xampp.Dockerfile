FROM ubuntu:20.04

# Instalar dependências e utilitários necessários
RUN apt-get update && apt-get install -y wget net-tools

# Baixar e instalar XAMPP
RUN wget https://deac-ams.dl.sourceforge.net/project/xampp/XAMPP%20Linux/8.0.30/xampp-linux-x64-8.0.30-0-installer.run
RUN chmod +x xampp-linux-x64-8.0.30-0-installer.run
RUN ./xampp-linux-x64-8.0.30-0-installer.run --mode unattended

# Limpar
RUN rm xampp-linux-x64-8.0.30-0-installer.run
RUN apt-get clean

EXPOSE 80 443 3306

# Iniciar XAMPP
CMD /opt/lampp/lampp start && tail -f /dev/null