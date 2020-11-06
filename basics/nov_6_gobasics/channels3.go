package main

import (
	"fmt"
	"sync"
)

var wg = sync.WaitGroup{}

func main() {
	ch := make(chan int, 50)
	wg.Add(2)
	//recieving go routine
	go func(ch <-chan int) {
		i := <-ch
		fmt.Println(i)
		i = <-ch
		fmt.Println(i)
		wg.Done()
	}(ch)
	//sending go routine
	go func(ch chan<- int) {
		ch <- 42
		ch <- 27
		wg.Done()
	}(ch)
	wg.Wait()
}