FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntunoble

# Instalar dependencias necesarias, incluyendo las de Qt y xcb
RUN apt-get update && apt-get install -y \
    libstdc++6 \
    libx11-6 \
    libglib2.0-0 \
    libxrender1 \
    libxext6 \
    libintl-perl \
    openjdk-11-jre \
    wget \
    unzip \
    libxcb-xinerama0 \
    libusb-0.1-4 \
    # Dependencias de Qt y xcb
    libqt5widgets5 \
    libqt5gui5 \
    libqt5core5a \
    libqt5dbus5 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-render0 \
    libxcb-shape0 \
    libxcb-sync1 \
    libxcb-xfixes0 \
    libxcb-xinerama0 \
    libxcb-xkb1 \
    libxkbcommon-x11-0 \
    libxkbcommon0 \
    qt5-gtk-platformtheme \
    && rm -rf /var/lib/apt/lists/*

# Descargar e instalar Viva Designer
RUN wget "https://viva.systems/download/vivadesigner11-64-bit-free-debian-deb/?wpdmdl=8041&refresh=668cfa667d4841720515174&ind=0&filename=viva-designer-free-11.0.0-9016_debian_9_x86_64_BETA.deb.zip" -O /tmp/viva-designer.zip \
    && unzip /tmp/viva-designer.zip -d /tmp \
    && find /tmp -name "*.deb" -exec dpkg -i {} \; \
    && rm -rf /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000

VOLUME /config