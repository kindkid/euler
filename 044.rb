# Ruby solution
# Answer: 5482660
# Computed in 7m19s :(
# But, at least I'm thorough, instead of just lucky.
require 'set'
require 'priority_queue'

start = Time.now

$max_p = 0
$max_n = 0
P = {}
Pset = Set.new
def pent(n)
  while $max_n < n
    $max_n += 1
    $max_p = ($max_n * (3*$max_n - 1) / 2)
    Pset << $max_p
    P[$max_n] = $max_p
  end
  P[n]
end

def pentagonal?(p)
  pent($max_n + 1) while $max_p < p
  Pset.include?(p)
end

Q = PriorityQueue.new
Q.change_priority([1,2,pent(1),pent(2)], pent(2) - pent(1))

loop do
  data, d = Q.delete_min
  m, n, pm, pn = data
  if pentagonal?(d) && pentagonal?(pm + pn)
    puts d
    break
  else
    pn1 = pent(n+1)
    if n - m == 1
      Q.change_priority([n, n+1, pn, pn1], pn1 - pn)
    end
    Q.change_priority([m, n+1, pm, pn1], pn1 - pm)
  end
end

puts (Time.now - start)
