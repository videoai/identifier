# Identifier Docker

This Dockerfile allows you to run Identifier in a Docker Container. Even though it is running as a Docker container, the UI will still display on your Desktop.

## Pre-requisites

You need to have the right hardware

  * http://videoai-support.digitalbarriers.com/support/solutions/articles/4000122220-does-my-system-meet-the-requirements-for-identifier-

You need to have nvidia-docker installed and working

  *  https://github.com/NVIDIA/nvidia-docker
  
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
              -v identifier_local:/home/identifier/.local \
              -v identifier_config:/home/identifier/.config \
              -v identifier_cache:/home/identifier/.cache \
              videoai/identifier 
```
For convenience, you can simple run

```bash
make run
```

or to run in headless mode

```bash
make headless
```

## Documentation

You can get official documentation for SmartVis Identifier on our support portal.

  *  http://videoai-support.digitalbarriers.com/support/solutions/articles/4000142067-smartvis-identifier-1-1

