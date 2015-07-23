#!/usr/bin/env ruby

# How many chains, with a starting number below one million, contain exactly
# sixty non-repeating terms?

require 'set'

FACTORIAL = (0..9).map{|d| d.downto(2).reduce(1){|a,n|a*n}}

CHAIN_LENGTHS = [] #memoization

def next_number(n)
  result = 0
  while n > 0
    n,d = n.divmod(10)
    result += FACTORIAL[d]
  end
  result
end

count = 0
(1..999_999).each do |n|
  seen = []
  length = 0
  loop do
    seen << n
    length += 1
    n = next_number(n)
    if CHAIN_LENGTHS[n]
      length += CHAIN_LENGTHS[n]
      break
    elsif seen.include?(n)
      break
    end
  end
  count += 1 if length == 60
  seen.each do |n|
    CHAIN_LENGTHS[n] = length
    length -= 1
  end
end

puts count
