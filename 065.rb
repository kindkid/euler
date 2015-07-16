#!/usr/bin/env ruby

# Find the sum of digits in the numerator of the 100th convergent of the
# continued fraction for e.

def sequence(initial, &gen)
  Enumerator.new do |y|
    y.yield initial
    n = 0
    loop do
      y.yield gen.call(n)
      n += 1
    end
  end
end

def convergent(n, seq)
  seq.take(n).reverse.reduce{|a,x|x + 1.to_r/a}
end

def convergent_sqrt_2(n)
  return convergent(n, sequence(1) {|n| 2})
end

def convergent_e(n)
  return convergent(n, sequence(2) {|n| (n % 3 == 1) ? 2*(1+n/3) : 1})
end

def sum_of_digits(n)
  result = 0
  while n > 0
    n,d = n.divmod(10)
    result += d
  end
  result
end

puts sum_of_digits(convergent_e(100).numerator)
