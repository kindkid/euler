# Which prime, below one million, can be written as the sum of the most
# consecutive primes?

# Answer: 997651 
# Ruby solution. 392ms (24ms if primes are pre-computed)
prep = Time.now
require 'set'
CAP = 1_000_000
PRIMES = []
begin
  n = CAP
  marked = [false] * n
  (2..n).each do |i|
    next if marked[i]
    PRIMES << i
    (i..n).step(i) do |j|
      marked[j] = true
    end
  end
end


PrimeSet = Set.new(PRIMES)

start = Time.now
upper_bound = 0
sum = 0
while sum < CAP
  sum += PRIMES[upper_bound]
  upper_bound += 1
end

upper_bound.downto(1) do |terms|
  offset = 0
  sum = PRIMES[offset, terms].reduce(:+)
  while sum < CAP
    if PrimeSet.include?(sum)
      finish = Time.now
      puts sum
      puts "Composed of #{terms} consecutive primes, starting at #{PRIMES[offset]}"
      puts "Algo  time: %1.4fs" % (finish - start)
      puts "Total time: %1.4fs" % (finish - prep)
      exit
    end
    sum -= PRIMES[offset]
    sum += PRIMES[offset + terms]
    offset += 1
  end
end
