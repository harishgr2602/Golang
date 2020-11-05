package main

import (
	"fmt"
)

func main() {
	//shortcircuit operation with if by logical operators
	number := 50
	guess := -5
	if guess < 1 || returnTrue() || guess > 100 {
		fmt.Println("The guess must be between 1 and 100")
	}
	if guess >= 1 && guess <= 100 {
		if guess < number {
			fmt.Println("Too low")
		}
		if guess > number {
			fmt.Println("Too high")
		}
		if guess == number {
			fmt.Println("You got it!")
		}
		fmt.Println(number <= guess, number >= guess, number != guess)
	}
}
func returnTrue() bool {
	fmt.Println("returning true")
	return true
}
