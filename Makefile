build:
	nvidia-docker build -t videoai/identifier --force-rm=true .
	
bash:
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
	
run:
	nvidia-docker run \
		--rm \
		-ti \
		-e DISPLAY=${DISPLAY} \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v identifier_local:/home/identifier/.local \
		-v identifier_config:/home/identifier/.config \
		-v identifier_cache:/home/identifier/.cache \
		videoai/identifier
headless:
	nvidia-docker run \
		--rm \
		-ti \
		--name identifier \
		-v identifier_local:/home/identifier/.local \
		-v identifier_config:/home/identifier/.config \
		-v identifier_cache:/home/identifier/.cache \
		videoai/identifier \
		/opt/identifier/identifier.sh
