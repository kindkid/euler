#!/usr/bin/env ruby

# Find the last ten digits of 28433 * 2**7830457 + 1

n = 28433
7830457.times do
  n = (n << 1) % 10_000_000_000
end
puts n+1
