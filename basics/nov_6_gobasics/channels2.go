package main

import (
	"fmt"
	"sync"
)

var wg = sync.WaitGroup{}
// by for loop creating 5 routines

func main() {
	ch := make(chan int)
	for j := 0; j < 5; j++ {
		wg.Add(2)

		//recieving go routine
		go func() {
			i := <-ch
			fmt.Println(i)
			wg.Done()
		}()

		//sending go routine
		
		go func() {
			ch <- 42
			wg.Done()
		}()
	}
	wg.Wait()
}
