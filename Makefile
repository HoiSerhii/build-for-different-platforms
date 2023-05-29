default: help

APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=amilorium
VERSION ?= $(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS ?= linux
TARGETARCH ?= amd64

get:
	go get

build: get	## Build simple app
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o httpserver -ldflags="-X 'github.com/HoiSerhii/build-for-different-platforms/main.appVersion=${VERSION}'"

image: build
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	docker rmi -f ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

help: ## This help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'