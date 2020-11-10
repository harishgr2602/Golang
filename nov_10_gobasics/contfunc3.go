package main

import (
	"fmt"
)
//continuous function with recover and panic
func main() {
	fmt.Println(mul(3, 0))
	fmt.Println(mul(3, 5))
	demPanic()
}
func mul(num1, num2 int) int {
	defer func() {
		fmt.Println(recover())
	}()
	solution := num1 * num2
	return solution
}
func demPanic() {
	defer func() {
		fmt.Println(recover())
	}()
	panic("Panic")
}
