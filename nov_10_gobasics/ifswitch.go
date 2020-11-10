package main

import (
	"fmt"
)
//switch case 
func main() {
	age := 18
	switch age {
	case 16:
		fmt.Println("prepare for college")
	case 18:
		fmt.Println("Dont be childish")
	case 20:
		fmt.Println("Get yourself an job")
	default:
		fmt.Println("Are you even alive")
	}
}
