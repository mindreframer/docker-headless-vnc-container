ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

build:
	docker build \
		-f Dockerfile.ubuntu.xfce.vnc \
		-t mindreframer/ubuntu-xfce-vnc \
		.


build-small:
	docker build \
		-f Dockerfile.ubuntu.xfce.small \
		-t mindreframer/ubuntu-xfce-small \
		.

start:
	docker run  \
		-d \
		--rm \
		--user 0 \
		-p 5901:5901 \
		-v ${ROOT_DIR}:/app \
		-e VNC_RESOLUTION=1280x800 \
		mindreframer/ubuntu-xfce-vnc

start-small:
	docker run  \
		-d \
		--rm \
		--user 0 \
		-p 5901:5901 \
		-p 6901:6901 \
		-v ${ROOT_DIR}:/app \
		-e VNC_RESOLUTION=1280x800 \
		mindreframer/ubuntu-xfce-small

start-original:
	docker run  \
		-d \
		--rm \
		--user 0 \
		-p 5901:5901 \
		-p 6901:6901 \
		-v ${ROOT_DIR}:/app \
		-e VNC_RESOLUTION=1280x800 \
		consol/ubuntu-xfce-vnc

PIDS:=$(shell docker ps|grep ubuntu-xfce-vnc|awk '{print $$1}')

kill:
	docker kill ${PIDS}
