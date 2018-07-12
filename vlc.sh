# Not working yet - not sure why :-(

nvidia-docker run \
           --rm \
           -ti \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v /dev/snd:/dev/snd --privileged \
           -v identifier_local:/home/identifier/.local \
           -v identifier_config:/home/identifier/.config \
           videoai/identifier \
           vlc
