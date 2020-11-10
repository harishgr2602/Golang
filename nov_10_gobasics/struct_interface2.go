package main

import (
	"fmt"
	"math"
)
//interfacing the structures
func main() {
	squr := Square{20, 20}
	circ := Circle{4}

	fmt.Println("Area of Square =", getArea(squr))
	fmt.Println("Area of Circle =", getArea(circ))
}

type Shape interface {
	area() float64
}
type Square struct {
	height float64
	width  float64
}
type Circle struct {
	radius float64
}

func (s1 Square) area() float64 {
	return s1.height * s1.width
}
func (c1 Circle) area() float64 {
	return math.Pi * math.Pow(c1.radius, 2)
}
func getArea(shape Shape) float64 {
	return shape.area()
}
