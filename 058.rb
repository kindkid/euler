def prime?(n)
  return true if n == 2 || n == 3 || n == 5 || n == 7
  return false if (n % 2 == 0) || (n % 3 == 0)
  ub = Math.sqrt(n).floor
  i = 0
  loop do
    i += 6
    return false if n % (i - 1) == 0
    return false if n % (i + 1) == 0
    return true if i > ub
  end
end

start = Time.now
length = 1
primes = 0
diagonals = 1
loop do
  n = length ** 2
  3.times do
    n += length + 1
    primes += 1 if prime?(n)
  end
  length += 2
  diagonals += 4
  break if primes * 10 < diagonals
end
puts length

puts "Finished in %1.3fs" % (Time.now - start)
