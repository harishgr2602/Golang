package main

import (
	"fmt"
)
//switch case
func main() {
	num := 1
	switch num {
	case 1:
		fmt.Println("switch got executed")
	case 2:
		fmt.Println("switch is not executed")
	default:
		fmt.Println("no values assigned")
	}
}
