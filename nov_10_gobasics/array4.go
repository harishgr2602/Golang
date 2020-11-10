package main

import (
	"fmt"
)

func main() {
	OddNum := [5]int{1, 3, 5, 7, 9}
	for i, value := range OddNum {
		fmt.Println(value, i)
	}
}
