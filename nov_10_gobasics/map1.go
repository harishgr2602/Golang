package main

import (
	"fmt"
)

func main() {
	Student := make(map[string]int)
	Student["Aryya"] = 42
	fmt.Println(Student["Aryya"])
	fmt.Println(len(Student))

	Student["Praveen"] = 43
	fmt.Println(len(Student))
	delete(Student, "Praveen")
	fmt.Println(len(Student))
}
