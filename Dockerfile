# because we are running Identifier in X we need nvidia and opengl, so use their base image
#FROM nvidia/opengl:1.0-glvnd-devel
FROM nvidia/cudagl:9.2-runtime

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
RUN ls -al
#RUN wget https://www.dropbox.com/s/89essafxlyjyhr9/SmartVis_Identifier-1.1.0.1485.fc15f8-NOLICENSE_INTERNAL-Linux.deb \
#         --progress=bar:force:noscroll \
 #        -q \
#         --show-progress
COPY SmartVis_Identifier-*-Linux.deb /root
RUN dpkg -i /root/SmartVis_*-Linux.deb

# Run as identifier user
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/identifier && \
    echo "identifier:x:${uid}:${gid}:Identifier,,,:/home/identifier:/bin/bash" >> /etc/passwd && \
    echo "identifier:x:${uid}:" >> /etc/group && \
    echo "identifier ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/identifier && \
    chmod 0440 /etc/sudoers.d/identifier && \
    chown ${uid}:${gid} -R /home/identifier &&\
    usermod -a -G audio,video identifier
ENV HOME /home/identifier
ENV EDITOR gedit

# Create dirs where data is stored and make sure identifier user has permission
RUN mkdir -p "/home/identifier/.local" && chown -R identifier:identifier "/home/identifier/.local"
RUN mkdir -p "/home/identifier/.config" && chown -R identifier:identifier "/home/identifier/.config"
RUN mkdir -p "/home/identifier/.cache" && chown -R identifier:identifier "/home/identifier/.cache"
USER identifier

# Run the app when the container is run
ENV LD_LIBRARY_PATH=/opt/identifier/lib:${LD_LIBRARY_PATH}
ENV PAPILLON_INSTALL_DIR=/opt/identifier
CMD /opt/identifier/SmartVisIdentifier










