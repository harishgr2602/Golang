package main

import (
	"fmt"
)
//continuous function with defer
func main() {
	defer FirstRun()
	SecondRun()
}

func FirstRun() {
	fmt.Println("I executed first")
}
func SecondRun() {
	fmt.Println("I executed second")
}
