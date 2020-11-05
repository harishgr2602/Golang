package main

import (
	"fmt"
	"log"
)

func main() {
	fmt.Println("start")
	defer func() {
		
		//anonmys function
		if err := recover(); err != nil {
			log.Println("Error:", err)
		}
	}()
	panic("something bad happend")
	fmt.Println("end")
}
