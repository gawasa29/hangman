package main

import (
	"fmt"
	"strconv"
	"strings"
)

func main() {
	var warong int = 0
	var win bool = false
	var char string
	answer := "pekonra"
	correct := 0
	fmt.Println("welcom to hangman")
	for !win {
		fmt.Println("Guess one letter!")
		fmt.Scan(&char)
		if strings.Contains(answer, char) {
			fmt.Println("Correct you answered→ → → " + char)
			correct += 1
			temp := strconv.Itoa(len(answer) - correct)
			fmt.Println("Remaining characters→ → →" + temp)
			if correct == len(answer) {
				fmt.Println("I was able to help" + answer)
				break
			}
		} else {
			warong += 1
			tmp := strconv.Itoa(warong)
			fmt.Println("The number of times you made a mistake is→ → → " + tmp)
			fmt.Println("Remaining characters→ → →" + strconv.Itoa(len(answer)))
			if warong > 3 {
				win = true
			}
		}
	}
	fmt.Println("You lose.")
}
