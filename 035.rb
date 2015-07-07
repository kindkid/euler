PRIMES = {}
begin
  n = 1_000_000
  marked = [false] * n
  (2..n).each do |i|
    next if marked[i]
    PRIMES[i] = true
    (i..n).step(i) do |j|
      marked[j] = true
    end
  end
end

def rotate(n)
  (n / 10) + (n % 10) * 10**(n.to_s.size - 1)
end

result = {}
PRIMES.keys.each do |p|
  n = rotate(p)
  circular = true
  while n != p
    if PRIMES[n]
      n = rotate(n)
    else
      circular = false
      break
    end
  end
  result[p] = true if circular
end

puts result.keys.sort.inspect
puts
puts result.size
