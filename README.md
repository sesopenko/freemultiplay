# freemultiplay
Open source multplayer game system using [Docker](https://www.docker.com/) and [Godot](https://godotengine.org/).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## Goals

* Multiplayer godot game which can act as a server or client
* Docker image for server
* Web API application for game client to communicate with
  * Can start a server via an api call. Spins up a container with the game server running and informs client of ip and port to connect to.
  * Can list active sessions
  * Can kill servers that aren't in use

## License

Licensed Apache 2.0, detailed in [LICENSE](LICENSE)