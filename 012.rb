n = 2_000_000
marked = [false] * n
primes = []
(2..n).each do |i|
  next if marked[i]
  primes << i
  (i..n).step(i) do |j|
    marked[j] = true
  end
end

i = 0
t = 0
loop do
  i += 1
  t += i
  n = t
  d = 1
  primes.each do |p|
    break if n == 1
    puts 'crap!' if p == primes.last
    c = 0
    while n % p == 0
      n /= p
      c += 1
    end
    d *= (c+1)
  end
  break if d > 500
end

puts t
