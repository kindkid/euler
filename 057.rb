def digits(n)
  return 1 + Integer(Math.log10(n))
rescue FloatDomainError
  count = 0
  while n > 0
    count += 1
    n /= 10
  end
  count
end

start = Time.now
c = 0
n = 1
d = 1
1000.times do
  n, d = (n + 2*d), (n+d)
  c += 1 if digits(n) > digits(d)
end
puts c
puts "Finished in %dms" % ((Time.now - start)*1000)
