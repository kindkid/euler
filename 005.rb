primes = {}
(2..20).each do |n|
  primes.to_a.each do |p, c|
    i = 0
    while n >= p && n % p == 0
      i += 1
      n /= p
    end
    primes[p] = i if i > c
  end
  primes[n] = 1 if n > 1
  puts primes
end
puts primes.reduce(1){|a, (p,c)| a*(p**c)}
