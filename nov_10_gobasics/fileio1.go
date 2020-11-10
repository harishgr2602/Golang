package main

import (
	"log"
	"os"
)
//creation of file with go
func main() {
	file, err := os.Create("samp.txt")
	if err != nil {
		log.Fatal(err)
	}
	file.WriteString("My golang concepts are in process")
	file.Close()
}
