package main

import (
	"fmt"
)

func main() {
	Authors := map[string]map[string]string{
		"Shakesphere": map[string]string{
			"BookName":  "Mercy of pain",
			"Publisher": "AR betalis",
		},
		"APJ": map[string]string{
			"BookName":  "Wings of fire",
			"Publisher": "CK padbanaban",
		},
	}
	if temp, writer := Authors["APJ"]; writer {
		fmt.Println(temp["BookName"], temp["Publisher"])
	}
}
