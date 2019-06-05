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
APP				?= autobot-docsbot2
NS				?= default
PORT			?= 8080

.PHONY: build

all: build push

build: 		; docker build -t $(IMAGE) .
run: 		; docker run -it $(IMAGE)
push:		; docker push $(IMAGE)

kubeme:

	kubectl config use-context md
