# Contributing to FreeMultiPlay

## Setting up a dev environment

1. Install [Godot ](https://godotengine.org/)
2. Install [Docker](https://docker.com/)
3. Build dockerfile `cd godot && docker build . -t "dedicated"
4. Test docker image `docker run -it dedicated`. Should run without errors.
5. Install [Minikube](https://minikube.sigs.k8s.io/docs/start/)
6. Install [Go](https://golang.org/doc/install)
7. Install Cobra: `go install github.com/spf13/cobra/cobra`