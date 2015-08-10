package main

import "fmt"

func next_collatz_number(n int) int {
  if n % 2 == 0 {
    return n / 2.0
  } else {
    return 3*n + 1
  }
}

func main() {
  var max_sequence_size, answer = 0, 1
    for i := 1; i <= 1000000; i++ {
      var sequence_element = i
      var sequence_size = 1;

      for sequence_element != 1 {
        sequence_size++
          sequence_element = next_collatz_number(sequence_element)
      }

      if sequence_size > max_sequence_size {
        max_sequence_size = sequence_size
          answer = i
      }
    }
  fmt.Printf("answer is %d with size %d\n", answer, max_sequence_size)
}
