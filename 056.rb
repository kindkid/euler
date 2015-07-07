def digitsum(n)
  result = 0
  while n > 0
    result += (n % 10)
    n /= 10
  end
  result
end

start = Time.now
max = 0
(1..100).each do |n|
  (1..100).each do |m|
    p = n ** m
    s = digitsum(p)
    max = s if s > max
  end
end
puts max
puts "Finished in %1.4fs" % (Time.now - start)
