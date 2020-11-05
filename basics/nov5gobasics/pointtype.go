package main

import (
	"fmt"
)

func main() {
	var ms *myStruct
	
	//buitin new function
	ms = new(myStruct)
	ms.foo = 42
	//ms = &myStruct{foo: 32}
	fmt.Println(ms.foo)
}

type myStruct struct {
	foo int
}
