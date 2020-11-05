package main

import (
	"fmt"
)

type Doctor struct {
	number     int
	Doctorname string
	companies  []string}

func main() {
	aDoctor := Doctor{
		number:     3,
		Doctorname: "Dravid Mani",
		companies: []string{
			"Dinesh",
			"Moghan kumar",
			"Aswath",
		},
	}
	fmt.Println(aDoctor)
}
