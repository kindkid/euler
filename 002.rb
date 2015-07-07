a, b, s = 1, 2, 0
loop do
  break if a > 4_000_000
  s += a if a % 2 == 0
  a, b = b, a+b
end
puts s

