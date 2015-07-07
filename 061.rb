require 'set'

def first2(n)
  (n/1000)*10 + ((n/100) % 10)
end

def last2(n)
  ((n/10) % 10)*10 + (n % 10)
end

start = Time.now

FUNCS = {
  tri:  ->(n) { n*(n+1)/2   },
  sqr:  ->(n) { n*n         },
  pent: ->(n) { n*(3*n-1)/2 },
  hex:  ->(n) { n*(2*n-1)   },
  hept: ->(n) { n*(5*n-3)/2 },
  oct:  ->(n) { n*(3*n-2)   }
}

BY_FIRST_2 = Hash.new{|h,k| h[k] = Set.new}
MEMBERSHIPS = Hash.new{|h,k| h[k] = Set.new}


i = 0
untried = Set.new
loop do
  i += 1
  any_below_10k = false
  FUNCS.each do |sym, f|
    v = f.call(i)
    if v < 10_000
      any_below_10k = true
      if v > 999
        MEMBERSHIPS[v] << sym
        BY_FIRST_2[first2(v)] << v
        untried << v
      end
    end
  end
  break unless any_below_10k
end

CYCLES = Set.new
def explore(n, path=[], sets=[])
  n_set = MEMBERSHIPS[n].to_a
  return if n_set.size == 1 && sets.include?(n_set)
  path = path + [n]
  sets = sets + [n_set]
  if path.size() == 6
    if last2(n) == first2(path.first)
      if Set.new(sets.flatten).size == 6
        group = Set.new(path)
        CYCLES << group unless CYCLES.include?(group)
      end
    end
  else
    (BY_FIRST_2[last2(n)] - Set.new(path)).each do |n|
      explore(n, path, sets)
    end
  end
end
untried.each do |n|
  explore(n)
end

CYCLES.each do |cycle|
  sets = cycle.map{|n| MEMBERSHIPS[n].to_a}
  puts "%d : %s" % [cycle.reduce(:+), cycle.to_a.join(', ')]
  sets.each do |s|
    puts "  %s" % s.join(', ')
  end
end

puts "Finished in %1.3fs" % (Time.now - start)
