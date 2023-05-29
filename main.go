package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
)

var appVersion string

func getRoot(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("got / request\n")
	io.WriteString(w, "This is my website!\n")
}
func getHello(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("got /hello request\n")
	io.WriteString(w, "Hello, HTTP!\n")
}

func main() {

	http.HandleFunc("/", getRoot)
	http.HandleFunc("/hello", getHello)

	log.Println("Starting HTTP server, version", appVersion)
	err := http.ListenAndServe(":3333", nil)
	if err != nil {
		log.Fatal(err)
	}
}
