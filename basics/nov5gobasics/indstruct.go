package main

import (
	"fmt"
)

func main() {
	aDoctor := struct{ name string }{name: "Dravid mani"}
	anotherDoctor := aDoctor
	anotherDoctor.name = "Rishi kumar"
	fmt.Println(aDoctor)
	fmt.Println(anotherDoctor)

}
