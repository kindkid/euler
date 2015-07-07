# Truncatable Primesq
# Find the sum of the only eleven primes that are both truncatable from left to
# right, and from right to left. (eg 3797)
#
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
#
# Thoughts:
#  * Numbers must end with 3 or 7.
#  * Numbers cannot contain a 0, 4, 6, or 8.
#  * Numbers cannot contain a 2 or 5, except in the first digit.
#  * Numbers cannot begin with a 1 nor 9.
require 'time'

start = Time.now()
PRIME = {}
def prime?(n)
  return false if n == 1
  return PRIME[n] if PRIME.include?(n)
  (2..Math.sqrt(n)).each do |i|
    return (PRIME[n] = false) if n % i == 0 && i < n
  end
  PRIME[n] = true
end

LTR = {}
def ltr?(n)
  return LTR[n] if LTR.include?(n)
  return (LTR[n] = false) if !prime?(n)
  return (LTR[n] = true) if n < 10
  LTR[n] = ltr?(n.to_s[1..-1].to_i(10))
end

RTL = {}
def rtl?(n)
  return RTL[n] if RTL.include?(n)
  return (RTL[n] = false) if !prime?(n)
  return (RTL[n] = true) if n < 10
  RTL[n] = rtl?(n.to_s[0..-2].to_i(10))
end

qualified = []

previous_generation = [2,3,5,7]
loop do
  generation = []
  previous_generation.each do |a|
    [1,3,7,9].each do |b|
      c = a*10 + b
      if rtl?(c)
        generation << c
        qualified << c if ltr?(c)
      end
    end
  end
  previous_generation = generation
  break if generation.size == 0
end

puts qualified.inspect
puts qualified.reduce(:+)

puts (Time.now() - start) * 1000
