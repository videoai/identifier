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
		videoai/identifier \
		bash
	
run:
	nvidia-docker run \
		--rm \
		-ti \
		--name identifier \
		-e DISPLAY=${DISPLAY} \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		videoai/identifier
headless:
	nvidia-docker run \
		--rm \
		-ti \
		--name identifier \
		videoai/identifier \
		/opt/identifier/identifier.sh
		
clean:
	docker volume rm identifier_local identifier_config identifier_cache
		
running-bash:
	nvidia-docker exec -it identifier bash
