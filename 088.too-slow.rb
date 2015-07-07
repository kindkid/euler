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

(2..12_000).each do |k|
  two_k = 2*k
  catch(:finished_k) do
    combos = Set.new
    combos << {:p=>1, 1=>k}
    (k .. two_k).each do |n|
      if combos.any?{ |combo| combo[:p] == n }
        results[n] += 1
        puts "#{k}: #{n}"
        throw :finished_k
      else
        next_combos = Set.new
        combos.each do |combo|
          next if combo[:p] > two_k
          combo_p = combo[:p]
          combo.each do |a,c|
            next if a == k || a == :p
            new_combo = combo.dup
            if c == 1
              new_combo.delete(a)
            else
              new_combo[a] = c - 1
            end
            new_combo[a+1] = (combo[a+1] || 0) + 1
            new_combo[:p] = combo_p * (a+1) / a
            next_combos << new_combo
          end
        end
        combos = next_combos
      end
    end
  end
end

puts
puts results.keys.reduce(:+)
