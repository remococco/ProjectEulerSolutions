#!/usr/bin/env ruby

class Integer
  def collatz_next
    self.even? ? self / 2 : self * 3 + 1
  end
end

total = 1000000
max_sequence = 0
max_index = 0
seq_length_array = Array.new(total + 1, 0)

(1..total).each do |n|
  n_local = n
  seq_length = 1
  
  while n_local > 1 do
    # memoized optimization
    # note n_local can be greater than total but is less than total far more
    # memoizing took solution from ~13s to <1s
    if n_local <= total && seq_length_array[n_local] != 0
      seq_length += seq_length_array[n_local] - 1
      break
    end
    
    n_local = n_local.collatz_next
    seq_length += 1
  end
  
  seq_length_array[n] = seq_length
  max_index, max_sequence = [n, seq_length] if seq_length > max_sequence
end

puts "max number #{max_index} with length #{max_sequence}"