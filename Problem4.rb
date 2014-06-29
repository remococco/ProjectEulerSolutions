#!/usr/bin/env ruby

class Fixnum
   def is_palindrome?
      self.to_s.eql? self.to_s.reverse
   end
end
max = -1

100.upto(999) do |n|
   n.upto(999) do |m|
      product = n * m
      max = [max, product].max if product.is_palindrome?
   end
end

puts max
