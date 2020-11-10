package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
)

func main() {
	file, err := os.Create("samp.txt")
	if err != nil {
		log.Fatal(err)
	}
	file.WriteString("My golang concepts are in process")
	file.Close()
	stream, err := ioutil.ReadFile("samp.txt")
	if err != nil {
		log.Fatal(err)
	}
	s1 := string(stream)
	fmt.Println(s1)
}
