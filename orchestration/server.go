package orchestration

import (
	"github.com/google/uuid"
	"github.com/sesopenko/freemultiplay/protobuff"
	"time"
)

type GameServer struct {
	ID uuid.UUID `json:"ID"`
	CreationTime time.Time `json:"-"`
}

type ServerList struct {
	List map[string]*protobuff.GameServer
}

func NewServerList() ServerList {
	return ServerList{List: make(map[string]*protobuff.GameServer)}
}

func (l *ServerList) SpawnGameServer() * protobuff.GameServer {
	id := uuid.New()
	now := time.Now().Unix()
	server := &protobuff.GameServer{
		Id: id.String(),
		CreatedTime: now,
	}
	l.List[server.Id] = server
	return server
}