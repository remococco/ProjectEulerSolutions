#!/usr/bin/env ruby

class Fixnum
   def is_divisible_by_zero_through_twenty
      1.upto 20 do |n|
         return false unless self % n == 0
      end
   end
end

i = 1
i += 1 until i.is_divisible_by_zero_through_twenty
puts i
