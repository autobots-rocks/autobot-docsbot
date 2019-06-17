#                                 __                 __
#    __  ______  ____ ___  ____ _/ /____  ____  ____/ /
#   / / / / __ \/ __ `__ \/ __ `/ __/ _ \/ __ \/ __  /
#  / /_/ / /_/ / / / / / / /_/ / /_/  __/ /_/ / /_/ /
#  \__, /\____/_/ /_/ /_/\__,_/\__/\___/\____/\__,_/
# /____                     matthewdavis.io, holla!
#
include .make/Makefile.inc

VERSION 		?= $(shell git rev-parse HEAD)
IMAGE   		?= registry.gitlab.com/autobots.rocks/bots/autobot-docsbot:$(VERSION)
IMAGE_SECRET	?= docker-registry-autobot-docsbot
APP				?= autobot-docsbot
NS				?= default
PORT			?= 8080
GCE_DISK		?= autobot-docsbot
GCE_ZONE		?= us-central1-a

.PHONY: build

all: build push

build: 		; docker build -t $(IMAGE) .
run: 		; docker run -it $(IMAGE)
push:		; docker push $(IMAGE)

kubeme:

	kubectl config use-context md

create-disk:

	gcloud compute disks create $(GCE_DISK) --zone $(GCE_ZONE) --type pd-standard --size 10

delete-disk:

	gcloud compute disks delete $(GCE_DISK) --zone $(GCE_ZONE)

build-local:

	cd ~/workspace/work/autobots && make all PROJECT=autobot-module-docsbot
	cd ~/workspace/work/autobots/autobot-docsbot && npm install @autobot/module-docsbot@latest
	cd ~/workspace/work/autobots/autobot-docsbot && tsc && node dist/main.js

release:

	cd ~/workspace/work/autobots && make all PROJECT=autobot-module-docsbot
	cd ~/workspace/work/autobots/autobot-docsbot && npm install @autobot/module-docsbot@latest
	cd ~/workspace/work/autobots/autobot-docsbot && git commit -am"$(MESSAGE)" && git push
