# Ruby solution.
# 140 ms
require 'set'

start = Time.now

class Agonal
  def initialize(&formula)
    @formula = formula
    @max_v = 0
    @max_n = 0
    @v = {}
    @vset = Set.new
  end
  def of(n)
    while @max_n < n
      @max_n += 1
      @max_v = @formula.call(@max_n)
      @vset << @max_v
      @v[@max_n] = @max_v
    end
    @v[n]
  end
  def include?(v)
    of(@max_n + 1) while @max_v < v
    @vset.include?(v)
  end
end

Triangular = Agonal.new() {|n| n * (n+1) /2 }
Pentagonal = Agonal.new() {|n| n * (3*n - 1) / 2 }
Hexagonal  = Agonal.new() {|n| n * (2*n - 1) }

n = 1
loop do
  v = Triangular.of(n)
  n += 1
  next unless v > 40755
  if Pentagonal.include?(v) && Hexagonal.include?(v)
    puts v
    break
  end
end

puts (Time.now - start)*1000
