package main

import (
	"fmt"
)
//Mapping of values
func main() {
	StudentAge := make(map[string]int)
	StudentAge["Dinesh"] = 24
	StudentAge["Dravid"] = 23
	StudentAge["Moghan"] = 23
	StudentAge["Hari"] = 22
	StudentAge["Aswath"] = 23
	StudentAge["Deeraaj"] = 23
	StudentAge["Inam"] = 23
	StudentAge["Hemachandran"] = 22

	fmt.Println(StudentAge["Inam"])
	fmt.Println(len(StudentAge))
}
