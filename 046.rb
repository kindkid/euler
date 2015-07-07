# What is the smallest odd composite number that cannot be written
# as the sum of a prime and twice a square?

# 9 = 7 + 2*1^2
# 15 = 7 + 2*2^2
# 21 = 3 + 2*3^2
# 25 = 7 + 2*3^2
# 27 = 19 + 2*2^2
# 33 = 31 + 2*1^2


# Answer: 5777
# Ruby solution; makes no optimistic assumptions; finds answer in 313ms.

require 'set'
require 'prime'
require 'priority_queue'
start = Time.now
primes = Prime.instance.each_with_index
Q = PriorityQueue.new

p, pi = primes.next
s, si = 2, 0
Q.change_priority([p, pi, s, si], p+s)
highwater = 9
loop do
  data, sum = Q.delete_min
  p, pi, s, si = data
  si1 = si+1
  s1 = 2*(si1+1)**2
  Q.change_priority([p, pi, s1, si1], p + s1)
  if si == 0
    p1, pi1 = primes.next
    Q.change_priority([p1, pi1, s, si], p1 + s)
  end
  next if sum <= highwater
  next if sum % 2 == 0
  next if Prime.prime?(sum)
  (highwater+2 .. sum-1).step(2) do |odd|
    next if Prime.prime?(odd)
    finish = Time.now
    puts odd
    puts (finish - start)*1000
    exit
  end
  highwater = sum
end
