#!/usr/bin/env ruby

# The 5-digit number, 16807 = 7**5, is also a fifth power.
# Similarly, the 9-digit number, 134217728 = 8**9, is a ninth power.
# How many n-digit positive integers exist which are also an nth power?
# ---------------------------------------------------------------------

count = 0
n = 1
loop do
  (1..9).each do |base|
    number = (base**n)
    digits = number.to_s.length
    if digits > n
      break
    elsif digits == n
      #puts "#{base} ** #{n} == #{number}"
      count += 1
    elsif base == 9
      puts "Count: #{count}"
      exit
    end
  end
  n += 1
end
