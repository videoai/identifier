# Because we are running Identifier in X we need nvidia and opengl, so use their base image
FROM nvidia/cudagl:10.1-runtime-ubuntu16.04
MAINTAINER Kieron Messer 

# We need a special version of FFMPEG
RUN apt-get update && apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:jonathonf/ffmpeg-3
RUN apt-get -y update && apt-get -y install \
                ffmpeg \
                libavcodec-dev \
                libavdevice-dev \
                libavfilter-dev \
                libavformat-dev \
                libavutil-dev

# Install a few packages which are not part of base image
RUN apt-get update && apt-get -y install \
                       libpq5 \
                       libhdf5-10 \
                       libpulse-mainloop-glib0 \
                       libjasper-dev \
                       wget \
                       sudo \
                       gstreamer0.10-plugins-base \
                       gstreamer0.10-plugins-good \
                       libgstreamer0.10-dev \
                       libgstreamer-plugins-base0.10-dev \
                       vlc  \
                       libvlc-dev \
                       libvlccore-dev \ 
                       vim \
                       gedit \
                       python-requests \
                       python-psutil \
                       python-pip \
                       curl \
             && rm -rf /var/lib/apt/lists/*

RUN gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture)" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture).asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

RUN pip install oauth2 configparser

# Install the latest Identifier package
# Note, you need to copy the latest Identifier deb package to this directory

COPY SmartVis_*Linux*.deb /root
RUN dpkg -i /root/SmartVis_*Linux*.deb


# Run the app when the container is run
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENV LD_LIBRARY_PATH=/opt/identifier/lib:${LD_LIBRARY_PATH}
ENV PAPILLON_INSTALL_DIR=/opt/identifier
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD /opt/identifier/identifier_gui.sh










