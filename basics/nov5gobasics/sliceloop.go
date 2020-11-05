package main

import (
	"fmt"
)

func main() {
	//for maps

	statePopulations := map[string]int{
		"California":    3920049,
		"Texas":         2726449,
		"Florida":       5587874,
		"New York":      1251545,
		"Pennesylvania": 1204584,
		"Illinois":      1204565,
		"Ohio":          1135664,
		//for slices
		//s := [3]int{1, 2, 3}
		//for k, v := range s {
		//fmt.Println(k, v)
	}
	for k, v := range statePopulations {
		fmt.Println(k, v)
	}
}
