# Find the sum of all p where a * b = p and the digits of a,b,p contain 1..9 exactly once.

def unified(digits)
  digits.reduce(0){|a,n|a*10 + n}
end

DIGITS = (1..9).to_a

def pandigital(a,b,c)
  ticks = 0
  [a,b,c].each do |n|
    while n > 0
      d = n % 10
      return false if d == 0
      tick = (1 << (d - 1))
      return false if (ticks & tick) > 0
      ticks |= tick
      n /= 10
    end
  end
  ticks == (1 << 9) - 1
end

products = {}
(1..9).each do |a|
  DIGITS.select{|d| d != a}.permutation(4) do |p|
    b = unified(p)
    c = a * b
    products[c] = true if pandigital(a,b,c)
  end
end
DIGITS.permutation(2) do |p|
  a = unified(p)
  DIGITS.select{|d| !p.include?(d)}.permutation(3) do |p2|
    b = unified(p2)
    c = a * b
    products[c] = true if pandigital(a,b,c)
  end
end

puts products.keys.reduce(:+)
