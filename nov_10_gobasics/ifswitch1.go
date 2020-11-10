package main

import (
	"fmt"
)
//switch case
func main() {
	color := "blue"
	switch color {
	case "red":
		fmt.Println("color is red")
	case "blue":
		fmt.Println("color is blue")
	default:
		fmt.Println("COlor is not red or blue")
	}
}
