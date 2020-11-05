package main

import (
	"fmt"
	"math"
)

func main() {
	myNum := 0.1234567
	if math.Abs(myNum/math.Pow(math.Sqrt(myNum), 2)-1) < 0.001 {
		//if myNum == math.Pow(math.Sqrt(myNum), 2) {
		fmt.Println("they are same")
	} else {
		fmt.Println("they are different")
	}
}
