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

max_primes = 0
max_result = 0
(-999 .. 999).each do |a|
  (-999 .. 999).each do |b|
    n = 0
    loop do
      v = n*n + a*n + b
      break unless PRIMES.include?(v)
      n += 1
    end
    if n > max_result
      max_result = n
      max_primes = a * b
      puts "#{a}, #{b} : #{n}"
    end
  end
end

puts max_primes
