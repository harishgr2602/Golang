package main

import (
	"fmt")

const (
	_  = iota
	KB = 1 << (10 * iota)
	MB
	GB
	TB
	EB
	PB
	ZB
	YB
)

func main() {
	fileSize := 4000000000.
	fmt.Printf("%.2fMB", fileSize/MB)
}
