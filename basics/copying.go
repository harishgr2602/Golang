package main

import (
	"fmt"
)

func main() {
	//copying of values from one to another variable by array
	a := [...]int{1, 2, 3}
	b := a
	b[1] = 5
	fmt.Println(a)
	fmt.Println(b)
	//using pointers within array
	c := [...]int{1, 2, 3}
	d := &c
	d[1] = 5
	fmt.Println(c)
	fmt.Println(d)
}
