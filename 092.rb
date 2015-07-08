#!/usr/bin/env ruby

# A number chain is created by continuously adding the square of the digits in
# a number to form a new number until it has been seen before.
#
# For example,
# 44 → 32 → 13 → 10 → 1 → 1
# 85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89
#
# Therefore any chain that arrives at 1 or 89 will become stuck in an endless
# loop. What is most amazing is that EVERY starting number will eventually
# arrive at 1 or 89.
#
# How many starting numbers below ten million will arrive at 89?

def successor(n)
  s = 0
  until n.zero? do
    n, d = n.divmod(10)
    s += d**2
  end
  s
end

def destination(n)
  return 89 if n == 89
  return 1 if n == 1
  destination(successor(n))
end

def combine(digits)
  digits.reduce(0){|a,d| a*10 + d}
end

def factorial(n)
  (1..n).reduce(:*)
end

def permutations(digits)
  cardinalities = digits.reduce(Hash.new(0)) {|h, v| h[v] += 1; h}.values
  factorial(digits.size) / cardinalities.reduce(1){|a,c|a*factorial(c)}
end

count = 0
digits = [1,0,0,0,0,0,0]
loop do
  count += permutations(digits) if destination(combine(digits)) == 89
  idx = digits.find_index{|d| d < 9}
  break if idx.nil?
  d = digits[idx] + 1
  (0..idx).each{|i| digits[i] = d}
end
puts count
