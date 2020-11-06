package main

import (
	"fmt"
)

func main() {
	//synchronous function
	for i := 0; i < 5; i++ {
		func(i int) {
			fmt.Println(i)
		}(i)
	}
}
