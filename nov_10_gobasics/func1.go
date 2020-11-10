package main

import (
	"fmt"
)
//using functions
func main() {
	fmt.Println("5 + 4 = ", add(5, 4))
}
func add(a, b int) int {
	return a + b
}
