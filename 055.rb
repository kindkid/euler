# Output:
# 249
# Finished in 132ms

def reversed_digits(n)
  result = []
  while n > 0
    result << (n % 10)
    n /= 10
  end
  result
end

def from_digits(digits)
  digits.reduce(0){|a,d| a*10 + d}
end

def palindrome?(digits)
  (0..digits.size/2).all?{ |i| digits[i] == digits[-1 - i] }
end

start = Time.now
count = 0
(1..9999).each do |n|
  d = reversed_digits(n)
  found = false
  49.times do |i|
    n += from_digits(d)
    d = reversed_digits(n)
    if palindrome?(d)
      found = true
      break
    end
  end
  count += 1 unless found
end
finish = Time.now
puts count
puts "Finished in %dms" % ((finish - start)*1000)
