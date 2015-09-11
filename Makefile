NAME =			timemachine
VERSION =		latest
VERSION_ALIASES =	
TITLE =			TimeMachine
DESCRIPTION =		TimeMachine (AFPd + Netatalk + OpenVPN)
SOURCE_URL =		https://github.com/scaleway-community/scaleway-timemachine

IMAGE_VOLUME_SIZE =	150G
IMAGE_BOOTSCRIPT =	stable
IMAGE_NAME =		TimeMachine

## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
