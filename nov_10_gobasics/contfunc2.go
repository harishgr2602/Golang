package main

import (
	"fmt"
)
//continuous function recover and panic
func main() {
	fmt.Println(div(3, 0))
	fmt.Println(div(3, 5))
	demPanic()
}
func div(num1, num2 int) int {
	defer func() {
		fmt.Println(recover())
	}()
	solution := num1 / num2
	return solution
}
func demPanic() {
	defer func() {
		fmt.Println(recover())
	}()
	panic("Panic")
}
