# Because we are running Identifier in X we need nvidia and opengl, so use their base image
#FROM nvidia/opengl:1.0-glvnd-devel
#FROM nvidia/cudagl:9.2-runtime
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
             && rm -rf /var/lib/apt/lists/*


RUN pip install oauth2 configparser

# Install the latest Identifier package
<<<<<<< HEAD
# Note, you need to copy the latest Identifier deb package to this directory
COPY SmartVis_*Linux*.deb /root
RUN dpkg -i /root/SmartVis_*Linux*.deb
=======
COPY SmartVis_Identifier-*-Linux.deb /root
RUN dpkg -i /root/SmartVis_*-Linux.deb
>>>>>>> b99d852d241ad198f75d448f6a8571098e548af7

USER identifier

# Run the app when the container is run
ENV LD_LIBRARY_PATH=/opt/identifier/lib:${LD_LIBRARY_PATH}
ENV PAPILLON_INSTALL_DIR=/opt/identifier
CMD /opt/identifier/identifier_gui.sh










