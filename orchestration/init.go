package orchestration

import (
	"fmt"
	"html"
	"log"
	"net/http"
)

const SERVER_PORT = 8000

func Init() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hellow, %q", html.EscapeString(r.URL.Path))
	})

	log.Println(fmt.Sprintf("Listening on localhost: %d", SERVER_PORT))
	listen_port := fmt.Sprintf(":%d", SERVER_PORT)
	log.Fatal(http.ListenAndServe(listen_port, nil))
}