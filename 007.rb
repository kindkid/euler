primes = []
i = 1
while primes.size < 10_001
  i += 1
  primes << i unless primes.any?{|p| i % p == 0 }
end
puts primes.last
