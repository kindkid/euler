# Output:
#
# 142857
# Run time: 139ms

start = Time.now
def digits(n)
  result = []
  while n > 0
    result << n % 10
    n /= 10
  end
  result
end

i = 0
loop do
  i += 1
  digits1 = digits(i)
  digits6 = digits(i*6)
  if digits6.length > digits1.length
    i = 10 ** (digits1.length)
    next
  end
  sorted_digits = digits1.sort
  next unless sorted_digits == digits6.sort
  next unless sorted_digits == digits(i*5).sort
  next unless sorted_digits == digits(i*4).sort
  next unless sorted_digits == digits(i*3).sort
  next unless sorted_digits == digits(i*2).sort
  puts i
  break
end

puts "Run time: %dms" % ((Time.now - start)*1000).round
