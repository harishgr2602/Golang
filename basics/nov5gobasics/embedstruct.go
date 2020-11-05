package main

import (
	"fmt"
)

type Animal struct {
	name   string
	origin string
}
type Bird struct {
	//embedding two structs
	Animal
	SpeedKPH float32
	CanFly   bool
}

func main() {
	//literal struct
	b := Bird{
		Animal{name: "Ostrich", origin: "Africa"},
		SpeedKPH: 123,
		CanFly:   false,
	}
	//b.name = "Ostrich"
	//b.origin = "Africa"
	//b.SpeedKPH = 123
	//b.CanFly = false
	fmt.Println(b)
}
