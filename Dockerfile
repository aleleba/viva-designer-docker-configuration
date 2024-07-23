FROM ghcr.io/linuxserver/baseimage-kasmvnc:alpine320

# Instalar dependencias necesarias
RUN apk update && apk add --no-cache \
    libstdc++ \
    libx11 \
    glib \
    libxrender \
    libxext \
    libintl \
    openjdk11-jre \
    wget \
    tar

# Descargar e instalar Viva Designer
RUN wget https://viva.systems/es/servicio/descargas/?wpdmdl=8074 -O /tmp/viva-designer.tar.gz \
    && tar -xzvf /tmp/viva-designer.tar.gz -C /opt/ \
    && rm /tmp/viva-designer.tar.gz

# add local files
# COPY /root /

# ports and volumes
EXPOSE 3000

VOLUME /config