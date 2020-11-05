package main

import (
	"fmt"
)

func main() {
	
	i := 22
	switch {
	case i <= 10:
		fmt.Println("less than or equal to ten")
	case i <= 20:
		fmt.Println("greater than or equal to ten")
	default:
		fmt.Println("greater than twenty")
	}
}
