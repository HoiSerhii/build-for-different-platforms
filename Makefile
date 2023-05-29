default: help

TARGETOS ?= linux
TARGETARCH ?= amd64

build: 	## Build simple app
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o httpserver -ldflags="-X 'github.com/HoiSerhii/build-for-different-platforms/appVersion=${VERSION}'"

help: ## This help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'