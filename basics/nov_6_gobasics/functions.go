package main

import (
	"fmt"
)

func main() {
	greeting := "hello"
	name := "Stacy"
	sayGreeting(greeting, name)
}

func sayGreeting(greeting, name string) {
	fmt.Println(greeting, name)
	name = "Ted"
	fmt.Println(name)
}
