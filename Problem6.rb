#!/usr/bin/env ruby

puts 0.upto(100).inject(:+)**2 -
   0.upto(100).inject { |sum_of_squares, n| sum_of_squares += n**2 }
