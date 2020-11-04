package main

import (
	"fmt"
)

func main() {
	//a := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	//b := a[:]   //slice of all elementd
	//c := a[3:]  //slice from 4th element to end
	//d := a[:6]  //slice first 6 elements
	//e := a[3:6] // slice the 4th to 6th elements
	//fmt.Println(a)
	//fmt.Println(b)
	//fmt.Println(c)
	//fmt.Println(d)
	//fmt.Println(e)
	//using make functions for slices
	a := make([]int, 3, 100)
	fmt.Println(a)
	fmt.Printf("Length : %v\n", len(a))
	fmt.Printf("Capacity : %v\n", cap(a))

}
