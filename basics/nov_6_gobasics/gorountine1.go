package main

import (
	"fmt"
	"time"
)

//delay of message
func main() {
	go sayHello()
	time.Sleep(100 * time.Millisecond)
}
func sayHello() {
	fmt.Println("Hello")
}
