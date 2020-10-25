package orchestration

import (
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

const SERVER_PORT = 8000

func Init() {
	r := gin.Default()
	sl := NewServerList()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	r.PUT("/game-server", func(c *gin.Context) {
		server := sl.SpawnGameServer()
		c.ProtoBuf(http.StatusOK, server)
		log.Printf("New Server List:", sl)
	})
	r.Run()
}
