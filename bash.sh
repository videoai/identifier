
nvidia-docker run \
           --rm \
           -ti \
           -v /etc/localtime:/etc/localtime:ro \
	       --device /dev/snd \
	       --device /dev/dri \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v identifier_local:/home/identifier/.local \
           -v identifier_config:/home/identifier/.config \
           -v identifier_cache:/home/identifier/.cache \
           videoai/identifier \
           bash
