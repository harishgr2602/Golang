package main

import (
	"fmt"
)

//displaying the details
func main() {
	var students [3]string
	fmt.Printf("Students: %v\n", students)
	students[0] = "Dravid"
	students[1] = "Moghan"
	students[2] = "Dinesh"
	//to add an element in the array
	//fmt.Printf("Students: %v\n", students)
	fmt.Printf("Students #0: %v\n", students[0])
	fmt.Printf("Students #1: %v\n", students[1])
	fmt.Printf("Students #2: %v\n", students[2])
	fmt.Printf("Number of students: %v\n", len(students))
}
