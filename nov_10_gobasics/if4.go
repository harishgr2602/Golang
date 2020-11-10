package main

import (
	"fmt"
)

func main() {
	color := "red"
	if color == "red" {
		fmt.Println("color is red")
	} else if color == "blue" {
		fmt.Println("color is blue")
	} else {
		fmt.Println("Color is not blue or red")
	}
}
