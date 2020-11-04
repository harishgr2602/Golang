package main

import (
	"fmt"
)

//enumeration expression
const (
	isAdmin = 1 << iota
	isHeadquaters
	canSeeFinancials

	canSeeAfrica
	canSeeAsia
	canSeeEurope
	canSeeNorthAmerica
	canSeeSouthAmerica
)

func main() {
	var roles byte = isAdmin | canSeeFinancials | canSeeEurope
	//var roles byte = isAdmin | canSeeFinancials | canSeeAfrica
	//var roles byte = isAdmin | canSeeFinancials | canSeeAsia
	//var roles byte = isAdmin | canSeeFinancials | canSeeNorthAmerica
	//var roles byte = isAdmin | canSeeFinancials | canSeeSouthAmerica
	fmt.Printf("%b\n", roles)
	fmt.Printf("Is Admin? %v\n", isAdmin&roles == isAdmin)
	fmt.Printf("Is HQ? %v", isHeadquaters&roles == isHeadquaters)
}
