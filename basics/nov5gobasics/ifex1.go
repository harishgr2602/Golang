package main

import (
	"fmt"
)

func main() {
	statePopulations := map[string]int{
		"California":    3920049,
		"Texas":         2726449,
		"Florida":       5587874,
		"New York":      1251545,
		"Pennesylvania": 1204584,
		"Illinois":      1204565,
		"Ohio":          1135664,
	}
	if pop, ok := statePopulations["Florida"]; ok {
		fmt.Println(pop)
	}
}
