package main

import "fmt"

func main() {
	//another way to declare map
	statePopulations := make(map[string]int)
	//statePopulations := map[string]int{
	statePopulations = map[string]int{
		"California":    3920049,
		"Texas":         2726449,
		"Florida":       5587874,
		"New York":      1251545,
		"Pennesylvania": 1204584,
		"Illinois":      1204565,
		"Ohio":          1135664,
	}
	//with an index in map
	//m := map[[3]int]string{}
	//fmt.Println(statePopulations, m)

	//fmt.Println(statePopulations)

	// to manipulate an value from map
	statePopulations["Georgia"] = 1012125
	//to delete an entry from map
	delete(statePopulations, "Georgia")
	fmt.Println(len(statePopulations))
	fmt.Println(statePopulations)
}
