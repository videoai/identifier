FROM nvidia/cudagl:10.1-runtime-ubuntu18.04
MAINTAINER Kieron Messer 

RUN apt-get -y update

RUN apt-get -y install software-properties-common \
                       vim \
                       python-requests \
                       python-psutil \
                       python-pip \
                       libpq5 \
                       libhdf5-100 \
                       libpulse-mainloop-glib0 \
                       wget \
                       sudo \
                       gosu \
                       libgtk2.0-bin


RUN apt-get -y install gstreamer1.0-plugins-base \
                       gstreamer1.0-plugins-good \
                       libgstreamer1.0-dev \
                       libgstreamer-plugins-base1.0-dev

RUN add-apt-repository -y ppa:jonathonf/ffmpeg-4 \
                        && apt-get update \
                        && apt-get install -y ffmpeg

RUN apt-get install -y vlc \
                       libvlc-dev \
                       libvlccore-dev \
                       libavcodec-dev \
                       libavdevice-dev \
                       libavfilter-dev \
                       libavformat-dev \
                       libavutil-dev \
                       iputils-ping \
             && rm -rf /var/lib/apt/lists/*


# Note, you need to copy the latest Identifier deb package to this directory
COPY SmartVis_Identifier*-app.deb /root
RUN apt-get install -y /root/SmartVis_Identifier*-app.deb
COPY SmartVis_Identifier*-service.deb /root
RUN apt-get install -y /root/SmartVis_Identifier*-service.deb
# For Identifier 1.3 we need to copy blank license.  For 1.4 we will not.
COPY license.lic /opt/identifier/license.lic

# Run the app when the container is run
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENV LD_LIBRARY_PATH=/opt/identifier/lib:${LD_LIBRARY_PATH}
ENV PAPILLON_INSTALL_DIR=/opt/identifier

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD /opt/identifier/identifier_gui.sh









