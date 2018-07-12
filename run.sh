#!/usr/bin/env bash


nvidia-docker run \
           --rm \
           -ti \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v identifier_local:/home/identifier/.local \
           -v identifier_config:/home/identifier/.config \
           -v identifier_cache:/home/identifier/.cache \
           videoai/identifier
