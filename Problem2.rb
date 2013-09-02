#!/usr/bin/env ruby                                                                                                                                                                                  

sum = 0
prev_fib, current_fib = 1, 2

while current_fib < 4_000_000
  sum += current_fib if current_fib.even?
  prev_fib, current_fib = current_fib, prev_fib + current_fib
end

puts sum
