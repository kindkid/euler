#!/usr/bin/env ruby

# How many fractions lie between 1/3 and 1/2 in the sorted set of
# reduced proper fractions for d ≤ 12,000?
a_third = 1.0/3
count = 0
(5..12_000).each do |d|
  ((d/3)..(d/2)).each do |n|
    count += 1 if n.gcd(d) == 1 && n.to_f/d > a_third
  end
end

puts count
