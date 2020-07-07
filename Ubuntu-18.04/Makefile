TAG ?= ubuntu-18.04

# Build the Docker container
# You will need the Identifier installers and a license file
build:
	docker build -t videoai/identifier:${TAG} --force-rm=true .

build-no-cache:
	docker build --no-cache -t videoai/identifier:${TAG} --force-rm=true .


# Run with UI.
# Data persisted between runs in /buf/identifier
run:
	docker run  \
		--rm \
		-ti \
		--name identifier \
		-e LOCAL_USER_ID=`id -u ${USER}` \
		-e DISPLAY=${DISPLAY} \
		-e RLM_LICENSE=2764@192.168.86.197 \
		-v /etc/timezone:/etc/timezone:ro \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /buf/identifier:/home/identifier \
		videoai/identifier:${TAG}

# Run with UI.
# When you stop the container, all data will be lost
run-no-persistance:
	docker run  \
		--rm \
		-ti \
		--name identifier-no-persistence \
		-e LOCAL_USER_ID=`id -u ${USER}` \
		-e DISPLAY=${DISPLAY} \
		-e RLM_LICENSE=2764@192.168.86.197 \
		-v /etc/timezone:/etc/timezone:ro \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		videoai/identifier:${TAG}


# Run in headless mode
# Data persisted between runs in /buf/identifier
headless:
	docker run --gpus all \
		--rm \
		-ti \
		--name identifier \
		-e LOCAL_USER_ID=`id -u ${USER}` \
		-v /etc/timezone:/etc/timezone:ro \
		-v /etc/localtime:/etc/localtime:ro \
		-v /buf/identifier:/home/identifier \
		videoai/identifier:${TAG} \
		/opt/identifier/identifier.sh
		
running-bash:
	docker exec -it identifier bash

push:
	docker push videoai/identifier:${TAG}

bash-nox:
	docker run --gpus all \
		--rm \
		-ti \
		-e LOCAL_USER_ID=`id -u ${USER}` \
		-v /etc/timezone:/etc/timezone:ro \
		-v /etc/localtime:/etc/localtime:ro \
		-v /buf/identifier:/home/identifier \
		videoai/identifier:${TAG} \
		bash

bash:
	docker run  \
		--rm \
		-ti \
		--device /dev/snd \
		--device /dev/dri \
		-e LOCAL_USER_ID=`id -u ${USER}` \
		-e DISPLAY=${DISPLAY} \
		-v /etc/timezone:/etc/timezone:ro \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /buf/identifier:/home/identifier \
		videoai/identifier:${TAG} \
		bash

