package main

import (
	"fmt"
	"os"
	"time"
)

func pings(pings <-chan int, pongs chan<- int) {
	for {
		val := <-pings
		fmt.Println("ping")
		time.Sleep(200 * time.Millisecond)
		pongs <- val + 1
	}
}

func pongs(pings chan<- int, pongs <-chan int) {
	for {
		<-pongs
		fmt.Println("pong")
		time.Sleep(100 * time.Millisecond)
		pings <- 1
	}
}

func main() {
	
	ping := make(chan int)
	pong := make(chan int)

	go pings(ping, pong)
	go pongs(ping, pong)

	ping <- 1

	time.Sleep(2 * time.Second)
	os.Exit(0)
}
