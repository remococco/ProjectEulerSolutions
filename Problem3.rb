#!/usr/bin/env ruby

require 'prime'

def prime_factors(n)
  return [n] if Prime.prime?(n)
  
  2.upto(n) do |m|
    return [m] | prime_factors(n / m) if n % m == 0
  end
    
end

puts prime_factors(600851475143).uniq.max
