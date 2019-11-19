TAG ?= ubuntu-16.04

build:
	docker build -t videoai/identifier:${TAG} --force-rm=true .
	
bash-nox:
	docker run --gpus all \
		--rm \
		-ti \
		-e LOCAL_USER_ID=`id -u ${USER}` \
		-v /etc/timezone:/etc/timezone:ro \
		-v /etc/localtime:/etc/localtime:ro \
		-v ~/:/home/identifier \
		videoai/identifier:${TAG} \
		bash

bash:
	docker run --gpus all \
		--rm \
		-ti \
		-e LOCAL_USER_ID=`id -u ${USER}` \
		--device /dev/snd \
		--device /dev/dri \
		-e LOCAL_USER_ID=`id -u ${USER}` \
		-e DISPLAY=$DISPLAY \
		-v /etc/timezone:/etc/timezone:ro \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v ~/:/home/identifier \
		videoai/identifier:${TAG} \
		bash
	
run:
	docker run --gpus all \
		--rm \
		-ti \
		--name identifier \
		-e LOCAL_USER_ID=`id -u ${USER}` \
		-e DISPLAY=${DISPLAY} \
		-v /etc/timezone:/etc/timezone:ro \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v ~/:/home/identifier \
		videoai/identifier:${TAG}

headless:
	docker run --gpus all \
		--rm \
		-ti \
		--name identifier \
		-e LOCAL_USER_ID=`id -u ${USER}` \
		-v /etc/timezone:/etc/timezone:ro \
		-v /etc/localtime:/etc/localtime:ro \
		-v ~/:/home/identifier \
		videoai/identifier:${TAG} \
		/opt/identifier/identifier.sh

running-bash:
	docker exec -it identifier bash

push:
	docker push videoai/identifier:${TAG}
