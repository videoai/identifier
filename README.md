# Identifier Docker

This Dockerfile allows you to run Identifier in a Docker Container. 
Even though it is running as a Docker container, the UI will still 
display on your Desktop.

## Pre-requisites

  * Suitable [hardware](http://videoai-support.digitalbarriers.com/support/solutions/articles/4000122220-does-my-system-meet-the-requirements-for-identifier-)

  * The host OS needs to be the latest [Ubuntu 18.04 x64](https://releases.ubuntu.com/18.04/).

  * [Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu) version 19.03, or above.
  
  * [NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-docker).

  * If you want to just run the container, you will need to provide your [Dockerhub](https://dockerhub.com) account details
to your local Digital Barriers representative.  

  * If you wish to build the Docker container, you need to have the latest SmartVis Identifier Ubuntu 18.04 installation 
packages.  These can be obtained from the [Digital Barriers Support Site](http://videoai-support.digitalbarriers.com/support/home).

  * Running [SmartVis Face RLM Server](http://videoai-support.digitalbarriers.com/support/solutions/articles/4000155943-smartvis-face-server-and-mobile-6-2-5) with valid license. 
  
## Quick Start - Run
```shell script
# Log into Dockerhub
docker login
# Pull the Identifier image
docker pull videoai/identifier:ubuntu-18.04
# Allow X to run in your local X session
xhost +
# Run the Identifier
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
    videoai/identifier:ubuntu-18.04
```

There are a few tricks in this command.  
  * We need to make sure the app is displayed in your local X session.  
  * To persist the data across runs, we mount a local volume, i.e. **/buf/identifer**.  This gets mounted as 
  **/home/identifier** in the running container.  The Identifier database and logs get written here.  You can change
  this location of the local volume - as long as you have write permission. 
  * To allow the Identifier process running in the Docker container to write to this local volume, we need to pass the 
  local user id running the Docker container.  This is done by passing the **LOCAL_USER_ID** environment to the Docker 
  container.  This gets set by running ```id -u ${USER}``` in your local shell. If this is not set then Identifier will 
  not have permission to write data to the local volume.
  * You need provide the right IP address of the host that is running the SmartVisFace RLM service.  In the above example
  the RLM service is running on 192.168.86.197.

There is a shortcut to run the Docker container, by using the Makefile.
```shell script
make run
```

## Quick Start - Building

There is a Makefile with pre-configured commands and is the easiest way to build 
the Docker image and run the container.

```shell script
# Choose the base image, we currently recommend Ubuntu-16.04
cd Ubuntu-16.04
# Download Identifier deb package from support site and copy to working directory
cp ~/Downloads/SmartVis_Identifier-*.deb .
# Copy across the license file 
cp ~/Downloads/demoLicense.lic .
# Build the Docker image (this can take some time)
make build
# Enable X authentication
xhost +
# Run
make run
```

To run the container you have just built, use the same command as above.
  
## Headless mode
You can also run Identifier in headless mode.
```bash
make headless
```

## Documentation

You can get official documentation for SmartVis Identifier on our support portal.

  *  http://videoai-support.digitalbarriers.com/support/solutions/articles/4000115605-smartvis-identifier

