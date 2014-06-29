#!/usr/bin/env ruby

0.upto(1000) do |a|
   a.upto(1000) do |b|
      b.upto(1000) do |c|
         if a < b && b < c && a + b + c == 1000 && a**2 + b**2 == c**2
            puts  a*b*c
            exit
         end
      end
   end
end
