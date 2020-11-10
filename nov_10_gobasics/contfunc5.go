package main

import (
	"fmt"
)
//ARRAy AND FOR TO FUNCTION
func main() {
	fmt.Println(subemup(10, 20, 30, 40, 50))
}
func subemup(args ...int) int {
	prod := 0
	for _, value := range args {
		prod -= value
	}
	return prod
}
