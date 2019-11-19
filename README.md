# Identifier Docker

This Dockerfile allows you to run Identifier in a Docker Container. 
Even though it is running as a Docker container, the UI will still 
display on your Desktop.

## Pre-requisites

You need to have the right hardware

  * http://videoai-support.digitalbarriers.com/support/solutions/articles/4000122220-does-my-system-meet-the-requirements-for-identifier-

You need to have the docker version __19.03__ or above installed and working

  * https://docs.docker.com/install/linux/docker-ce/ubuntu
  
You need to have the latest NVIDIA Container Toolkit installed and working

  *  https://github.com/NVIDIA/nvidia-docker
  
## Quick Start
There is a Makefile with pre-configured commands and is the easiest way to build 
the Docker image and run the container.

```bash
# Choose the base image, we currently recommend Ubuntu-16.04
cd Ubuntu-16.04
# Download Identifier deb package from support site and copy to working directory
cp ~/Downloads/SmartVis_Identifier-*.deb .
# Build the Docker image (this can take some time)
make build
# Enable X authentication
xhost +
# Run Identifier
make run
```
  
## Building the docker image
```bash
make build
```

## Running the docker image

As it runs in X session you need to allow the Docker container permission to run an X session locally.  The simplest way to do this is to allow everything....

```bash
xhost +
```

Next you can run Identifier with the following command.  There are a few tricks in this command.  The first is to make sure the app is displayed in your local X session.  The second is to create a couple of Docker volumes to store the persistent Identifier data.

```bash
nvidia-docker run \
              --rm \
              -e DISPLAY=$DISPLAY \
              -v /tmp/.X11-unix:/tmp/.X11-unix \
              -v ~/:/home/identifier/ \
              videoai/identifier 
```
For convenience, you can simple run

```bash
xhost +
make run
```

or to run in headless mode

```bash
make headless
```

## Documentation

You can get official documentation for SmartVis Identifier on our support portal.

  *  http://videoai-support.digitalbarriers.com/support/solutions/articles/4000115605-smartvis-identifier

