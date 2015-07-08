#!/usr/bin/env ruby

# By listing the set of reduced proper fractions with denominators ≤ 1,000,000
# in ascending order of size, find the numerator of the fraction immediately
# to the left of 3/7.

best_denominator = 0
best_numerator = 0
best_distance = 1

target = 3.0/7
(1..1_000_000).each do |denominator|
  next if denominator == 7
  numerator = (denominator * target).to_i
  distance = target - (numerator.to_f / denominator)
  while (distance < best_distance)
    if numerator.gcd(denominator) == 1
      best_distance = distance
      best_numerator = numerator
      best_denominator = denominator
      break
    else
      numerator -= 1
      distance = target - (numerator.to_f / denominator)
    end
  end
end

puts "#{best_numerator}/#{best_denominator}"
