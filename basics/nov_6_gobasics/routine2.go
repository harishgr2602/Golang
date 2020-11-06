package main

import (
	"fmt"
)

var wg = sync.waitGroup{}

func main() {
	var msg = "Hello"
	wg.Add(1)
	go func(msg string) {
		fmt.Println(msg)
		wg.Done()
	}(msg)
	msg = "Goodbye"
	//time.Sleep(100 * time.Millisecond)
	wg.wait()
}
