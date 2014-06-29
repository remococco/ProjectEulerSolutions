#!/usr/bin/env ruby

require 'prime'

prime_count, i = [0] * 2
until prime_count == 10_001
   i += 1
   prime_count +=1 if Prime.prime? i
end

puts i
