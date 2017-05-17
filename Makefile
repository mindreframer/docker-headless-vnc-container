ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

build:
	docker build -f Dockerfile.ubuntu.xfce.vnc -t mindreframer/ubuntu-xfce-vnc .

start:
	docker run -d -p 5901:5901 -p 6901:6901 \
		--user 1 -v ${ROOT_DIR}:/app \
		-e VNC_RESOLUTION=1280x800 mindreframer/ubuntu-xfce-vnc
