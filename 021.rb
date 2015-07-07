PRIMES = []
begin
  n = 100_000
  marked = [false] * n
  (2..n).each do |i|
    next if marked[i]
    PRIMES << i
    (i..n).step(i) do |j|
      marked[j] = true
    end
  end
end

def prime_factors(n)
  result = Hash.new(0)
  PRIMES.each do |p|
    break if p > n
    while n > 1 && n % p == 0
      n /= p
      result[p] += 1
    end
  end
  raise "Hell! #{n}" unless n == 1
  return result
end

def nested_loop(*iterators)
  Enumerator.new do |y|
    i, *tail = *iterators
    unless i.respond_to?(:each)
      if i.is_a?(Fixnum)
        i = i.times
      else
        raise "Don't know how to iterate over #{i.inspect}"
      end
    end
    if tail.any?
      i.each do |v|
        nested_loop(*tail).each do |c|
          y << [v, *c]
        end
      end
    else
      i.each do |v|
        y << [v]
      end
    end
  end
end

def proper_divisors(n)
  Enumerator.new do |y|
    pf_primes = [1]
    pf_counts = [0]
    prime_factors(n).each do |p,c|
      pf_primes << p
      pf_counts << c
    end
    iterators = pf_counts.map{ |c| c+1 }
    nested_loop(*iterators).each do |i|
      d = 1
      pf_primes.each_with_index do |p, j|
        d *= p ** i[j]
      end
      if d < n
        y << d
      end
    end
  end
end

MEMO = {}
def sum_of_proper_divisors(n)
  return 0 if n == 0
  MEMO[n] ||= proper_divisors(n).reduce(0){|a,d| a+d}
end

puts (1..9999).select{|a| b = sum_of_proper_divisors(a); a != b && sum_of_proper_divisors(b) == a}.reduce(:+)
