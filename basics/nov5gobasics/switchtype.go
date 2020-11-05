package main

import (
	"fmt"
)

func main() {
	
	var i interface{} = [3]int{}
	switch i.(type) {
	case int:
		fmt.Println("i is a integer")
	case string:
		fmt.Println("i is a string")
	case float64:
		fmt.Println("i is a float64")
	case [3]int:
		fmt.Println("i is a array")
	default:
		fmt.Println("i is a other type")
	}
}
