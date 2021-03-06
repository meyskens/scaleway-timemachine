## -*- docker-image-name: "scaleway/timemachine:latest" -*-
FROM scaleway/openvpn:amd64-latest
# following 'FROM' lines are used dynamically thanks do the image-builder
# which dynamically update the Dockerfile if needed.
#FROM scaleway/openvpn:armhf-latest       # arch=armv7l
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/scw-builder-enter


# Install packages
RUN apt-get -q update \
 && apt-get -q -y upgrade \
 && apt-get install -y -q \
	avahi-daemon \
	netatalk \
 && apt-get clean


# User management
RUN useradd -md /backup timemachine \
 && echo timemachine:timemachine | chpasswd


# Patch rootfs
ADD ./overlay/ /


# Clean rootfs from image-builder
RUN /usr/local/sbin/scw-builder-leave
