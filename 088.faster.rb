# The smallest N such that there exists a set of size, k, natural numbers where
# a1 + a2 + ... + ak = N = a1 * a2 * ... * ak, shall be called the minimal
# product-sum of k.
#
# Examples:
# k=2: 4   (2,2)
# k=3: 6   (1,2,3)
# k=4: 8   (1,1,2,4)
# k=5: 8   (1,1,2,2,2)
# k=6: 12  (1,1,1,1,2,6)
#
# Find the sum of all the minimal product-sum numbers for 2 <= k <= 12000.
# Duplicates should not be counted more than once.

require 'set'
results = Hash.new(0)
max_k = 12_000
max_found_k = 0
combos = Set.new()
combos << {:p => 1, 0 => (max_k - 1), 1 => 1}
n = 1
loop do
  puts "#{n} : #{results.size} : #{combos.size}"
  break if results.size >= max_k
  next_combos = Set.new
  combos.each do |combo|
    combo_p = combo[:p]
    next if combo_p > max_k * 2
    if combo_p == n
      k = max_k - (combo[0] || 0)
      unless results.include?(k)
        results[k] = n
        max_found_k = (max_found_k .. max_k).find{|k| !results.include?(k)}
        max_found_k -= 1 unless max_found_k.nil?
      end
    end
    combo.each do |a,c|
      next if a == :p || a == max_k
      new_combo = combo.dup
      if c == 1
        new_combo.delete(a)
      else
        new_combo[a] = c - 1
      end
      new_combo[a+1]  = (combo[a+1] || 0) + 1
      new_combo[:p] = (combo[:p] * (a+1) / a) if a > 0
      next_combos << new_combo
    end
  end
  combos = next_combos
  n += 1  
end

results.delete(1)
puts results.inspect
puts
puts results.values.uniq.reduce(:+)
