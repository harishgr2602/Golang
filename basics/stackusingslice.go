package main

import "fmt"

func main() {
	//from begining
	//a := []int{1, 2, 3, 4, 5}
	//b := a[:1]
	//fmt.Println(b)
	//from the end
	//a := []int{1, 2, 3, 4, 5}
	//b := a[:len(a)-1]
	//fmt.Println(b)
	//from the middle
	a := []int{1, 2, 3, 4, 5}
	b := append(a[:2], a[3:]...)
	fmt.Println(b)
}
