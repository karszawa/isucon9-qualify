package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strings"
)

func main() {
	if len(os.Args) != 2 {
		panic("missing filename")
	}

	input := os.Args[1]

	fp, err := os.Open(input)
	if err != nil {
		panic(err)
	}
	defer fp.Close()

	reader := bufio.NewReaderSize(fp, 4096)
	for line := ""; err == nil; line, err = reader.ReadString('\n') {
		fmt.Print(line)

		if strings.HasPrefix(line, "func ") {
			words := strings.Split(strings.Replace(line, "(", " ", 1), " ")
			funcName := words[1]
			fmt.Printf("\tdefer measure.Start(\"%s\").Stop()\n\n", funcName)
		}

	}

	if err != io.EOF {
		panic(err)
	}
}
