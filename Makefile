build:
	docker build -t videoai/identifier --force-rm=true .
	
bash-nox:
	docker run --gpus all \
		--rm \
		-ti \
		videoai/identifier \
		bash

bash:
	docker run --gpus all \
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
	docker run --gpus all \
		--rm \
		-ti \
		--name identifier \
		-e DISPLAY=${DISPLAY} \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		videoai/identifier

headless:
	docker run --gpus all \
		--rm \
		-ti \
		--name identifier \
		videoai/identifier \
		/opt/identifier/identifier.sh
		
clean:
	docker volume rm identifier_local identifier_config identifier_cache
		
running-bash:
	docker exec -it identifier bash
