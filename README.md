# build-for-different-platforms
DevOps test project with makefile and docker image with build for different platforms


For build pass different OS and architecture
Default is linux with amd64
```
make build
make build TARGETOS=windows TARGETARCH=386
make build TARGETOS=darwin TARGETARCH=arm64
```