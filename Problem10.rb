#!/usr/bin/env ruby

require 'prime'

puts 0.upto(2_000_000).inject(0) { |sum, n| Prime.prime?(n)? sum + n : sum }
