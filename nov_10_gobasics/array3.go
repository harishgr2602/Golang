package main

import (
	"fmt"
)
//array with for
func main() {
	EvenNum := [5]int{0, 2, 4, 6, 8}
	for i, value := range EvenNum {
		fmt.Println(value, i)
	}
}
