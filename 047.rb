# The first two consecutive numbers to have two distinct prime factors are:
# 14 = 2 * 7
# 15 = 3 * 5
#
# The first three consecutive numbers to have three distinct prime factors are:
# 644 = 2^2 * 7 * 23
# 645 = 3 * 5 * 43
# 646 = 2 * 17 * 19
#
# Find the first four consecutive integers to have four distinct
# prime factors.

# Answer: 134043
# Ruby solution, completes in 3.3s.
start = Time.now
require 'prime'
p = Prime.instance
g = Prime::TrialDivisionGenerator
i = 2*3*5*7 + 3
loop do
  consecutive = 0
  (i-3 .. i+3).each do |n|
    if p.prime_division(n, generator = g.new).size == 4
      consecutive += 1
    else
      consecutive = 0
    end
    if consecutive == 4
      puts n - 3
      puts (Time.now - start)
      exit
    end
  end
  i += 4
end
