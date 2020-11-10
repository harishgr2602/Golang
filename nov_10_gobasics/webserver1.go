package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", handler)
	http.HandleFunc("/HELLO!!!", handler2)
	http.ListenAndServe(":8080", nil)
}
func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Welcome to my home page\n")
}
func handler2(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello world\n")
}
