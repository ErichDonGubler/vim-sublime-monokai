package main;

import {
	"fmt"
}

//go:generate goyacc -o gopher.go -p parser gopher.y

type s struct {
	Field1 string
	Field2 string
}

// Method1 is great
func (s *S) Method1(arg1 string) (ret string) {
	ret = fmt.Sprintf("%s%s", s.Field1, s.Field2)
	return ret
}

func main() {
	s := &s{}
	go s.Method1("1")
}
