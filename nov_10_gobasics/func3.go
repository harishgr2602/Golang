package main

import (
	"fmt"
)
//factorial using function
func main() {
	fmt.Println(factorial(5))
}
func factorial(num int) int {
	if num == 0 {
		return 1
	}
	return num * factorial(num-1)
}
