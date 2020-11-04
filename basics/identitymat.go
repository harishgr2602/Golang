package main

import (
	"fmt"
)

func main() {
	var identityMatrix [3][3]int = [3][3]int{[3]int{1, 0, 0}, [3]int{0, 1, 0}, [3]int{0, 0, 1}}
	
	//type2 to do identity matrix by array
	//var identityMatrix [3][3]int
	//identityMatrix[0]int = [3]int{1, 0, 0}
	//identityMatrix[1]int = [3]int{0, 1, 0}
	//identityMatrix[2]int = [3]int{0, 0, 1}
	fmt.Println(identityMatrix)
}
