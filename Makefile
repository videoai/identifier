

# Ubuntu 16.04 still preferred base for now
BASE ?= Ubuntu-18.04
TAG ?= latest

build:
	$(MAKE) -C ${BASE} build TAG=${TAG}

run:
	$(MAKE) -C ${BASE} run TAG=${TAG}

headless:
	$(MAKE) -C ${BASE} headless TAG=${TAG}

push:
	$(MAKE) -C ${BASE} push TAG=${TAG}


