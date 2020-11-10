package main

import (
	"fmt"
)
//mapping of values
func main() {
	Superhero := map[string]map[string]string{
		"Superman": map[string]string{
			"RealName": "Clark Kent",
			"City":     "Canada",
		},
		"Batman": map[string]string{
			"Realman": "Bruce Wayne",
			"City":    "Gotham City",
		},
	}
	if temp, hero := Superhero["Superman"]; hero {
		fmt.Println(temp["RealName"], temp["City"])
	}
}
