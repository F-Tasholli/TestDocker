# Usa una versione più recente di CentOS (o considerare l'uso di un'immagine più moderna come AlmaLinux o Ubuntu)
FROM centos:centos8

LABEL maintainer="contact@btreepress.com"

# Aggiorna il sistema e installa Node.js dal modulo AppStream
RUN dnf update -y && \
    dnf module enable -y nodejs:14 && \
    dnf install -y nodejs npm && \
    dnf clean all

# Imposta la directory di lavoro
WORKDIR /src

# Copia i file dell'applicazione nella directory di lavoro
COPY . .

# Installa le dipendenze dell'applicazione
RUN npm install

# Espone la porta 8080
EXPOSE 8080

# Comando di default per avviare l'applicazione
CMD ["node", "app.js"]
