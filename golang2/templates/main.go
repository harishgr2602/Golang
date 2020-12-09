package main

import (
	"html/template"
	"net/http"
)

func main() {
	http.HandleFunc("/", helloWorld)
	http.ListenAndServe(":8080", nil)
}

func helloWorld(w http.ResponseWriter, r *http.Request) {
	data := r.URL.Path
	name := Name{"Mindorks", data}
	template, _ := template.ParseFiles("home.html")
	template.Execute(w, name)
}

type Name struct {
	FName, LName string
}
