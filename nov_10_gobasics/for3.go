package main

import (
	"fmt"
)
// for loop with three varaibles
func main() {
	for i := 2; i < 10; i++ {
		for j := 0; j < i; j++ {
			for k := 0; k < j; k++ {
				fmt.Printf("/")
			}
			fmt.Println("*")
		}
		fmt.Println()
	}
}
