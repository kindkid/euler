# Ruby solution
#
# 121313
# Algo  time: 0.2118s
# Total time: 0.6074s

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

def digits_of(n)
  digits = []
  while n > 0
    digits << n % 10
    n /= 10
  end
  digits.reverse
end

FAMILY_SIZE = 8
MASKS = {}
def masks_for(size)
  MASKS[size] ||= begin
    masks = (1 << (size - 1)) - 1
    (1..masks).map do |mask|
      mask = (0..(size - 1)).map{ |i| (mask & (1 << i)) > 0 }
      if FAMILY_SIZE >= 8
        # We can optimize out the masks that will always end
        # up generating at least three multiples of 3.
        (mask.count{|b| b} % 3 == 0) ? mask : nil
      else
        mask
      end
    end.compact
  end
end

start = Time.now
checked = Set.new
PRIMES.each do |p|
  digits = digits_of(p)
  masks_for(digits.size).each do |mask|
    can_miss = 10 - FAMILY_SIZE
    found_one = false
    (0..9).each do |digit|
      n = 0
      digits.each_with_index do |d,i|
        n *= 10
        n += (mask[i] ? digit : d)
      end
      raise("hell") if n > CAP
      if digit == 0
        if checked.include?([mask,n])
          can_miss = -1
          break
        end
        checked << [mask,n]
      end
      if n >= p && PrimeSet.include?(n)
        found_one = n unless found_one
        next
      end
      can_miss -= 1
      break if can_miss < 0
    end
    if can_miss >= 0
      finish = Time.now
      puts found_one
      puts "Algo  time: %1.4fs" % (finish - start)
      puts "Total time: %1.4fs" % (finish - prep)
      exit
    end
  end 
end
