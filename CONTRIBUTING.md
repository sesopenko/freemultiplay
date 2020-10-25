# Contributing to FreeMultiPlay

## Setting up a dev environment

1. Install [Godot ](https://godotengine.org/)
2. Install [Docker](https://docker.com/)
3. Build dockerfile `cd godot && docker build . -t "dedicated"
4. Test docker image `docker run -it dedicated`. Should run without errors.
5. Install [Minikube](https://minikube.sigs.k8s.io/docs/start/)
6. Install [Go](https://golang.org/doc/install)
7. Install Cobra: `go install github.com/spf13/cobra/cobra`
8. Install Go Protocol Buffers: `go install google.golang.org/protobuf/cmd/protoc-gen-go`

## Generating protobuffs code

The golang code isn't checked into the project so you need to generate them before starting work.

### Windows generation

```batch
cd protobuff
gen_buffers.bat
```