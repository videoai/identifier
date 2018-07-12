#!/bin/bash

set -x
nvidia-docker build -t videoai/identifier --force-rm=true .
