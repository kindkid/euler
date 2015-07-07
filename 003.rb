n = 600851475143
f = 2
loop do
  n = n / f while n % f == 0
  break if n < f
  f += 1
end
puts f
