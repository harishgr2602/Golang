package main

import (
	"encoding/json"
	"fmt"
)

type Sport struct {
	Name  string
	Field string
}

func main() {
	
	sports := Sport{"MS Dhoni", "Cricket"}
	res, err := json.Marshal(sports)

	if err != nil {
		fmt.Println(err)
	}

	fmt.Println(string(res))
}
