package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
)

func main() {
	file, err := os.Create("my.txt")
	if err != nil {
		log.Fatal(err)
	}
	file.WriteString("im Gowtham, who learns golang concepts with the help of KLOUDLEARN")
	file.Close()
	stream, err := ioutil.ReadFile("my.txt")
	if err != nil {
		log.Fatal(err)
	}
	s2 := string(stream)
	fmt.Println(s2)
}
