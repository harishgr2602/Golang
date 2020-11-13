package main

import (
	"fmt"
	"time"
)

func concurrentFunc(done chan string) {
	for i := 0; i < 6; i++ {
		time.Sleep(time.Millisecond * 400)
		fmt.Println(i, " concurrentFunc")
	}
	fmt.Println("finished loop in concurrentFunc")
	done <- "goroutine finished"
}
func main() {
	done := make(chan string)
	go concurrentFunc(done)
	for i := 0; i < 3; i++ {
		time.Sleep(time.Millisecond * 400)
		fmt.Println(i, " main")
	}
	msg := <-done
	fmt.Println(msg)
}
