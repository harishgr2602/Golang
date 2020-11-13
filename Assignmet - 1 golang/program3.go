package main

import (
	"bufio"
	"fmt"
	"net"
	"time"
)

func check(err error, message string) {
	if err != nil {
		panic(err)
	}
	fmt.Printf("%s\n", message)
}

type MyWork struct {
	name string
	conn net.Conn
}

func genRes(myWorks chan MyWork) {
	for {
		myWork := <-myWorks

		for start := time.Now(); time.Now().Sub(start) < time.Second; {
		}

		myWork.conn.Write([]byte("Hello, " + myWork.name))
	}
}
func main() {
	myWorks := make(chan MyWork)
	go genRes(myWorks)

	ln, err := net.Listen("tcp", ":8080")
	check(err, "Server is ready.")

	for {
		conn, err := ln.Accept()
		check(err, "Accepted connection.")

		go func() {
			buf := bufio.NewReader(conn)

			for {
				name, err := buf.ReadString('\n')

				if err != nil {
					fmt.Printf("Client disconnected.\n")
					break
				}

				myWorks <- MyWork{name, conn}
			}
		}()
	}
}
