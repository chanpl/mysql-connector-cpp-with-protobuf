.PHONY: all build

include .version

PROJECTNAME=$(shell basename "$(PWD)")
ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

#V IMAGE: The image base name
IMAGE ?= chanpl/protobufclash:${VERSION}

BUILD_DATE = $(shell date --rfc-3339=date --utc)
BUILD_TIME = $(shell date --rfc-3339=seconds --utc)

all: build

## build: Build C++ build image.
build:
	@echo building ${IMAGE}
	@docker build \
		--build-arg PROTOBUF_VERSION=${PROTOBUF_VERSION} \
		--label image.algocore.version=${VERSION} \
		--label image.protobufclash.date="${BUILD_DATE}" \
		--tag ${IMAGE} \
		--pull \
		--compress \
		.
