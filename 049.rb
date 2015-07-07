# Brute-force solution.
require 'prime'
(1488..9999).each do |p0|
  next unless Prime.prime?(p0)
  p0d = p0.to_s.chars.sort
  (p0+1..9999).each do |p1|
    next unless Prime.prime?(p1)
    p2 = 2*p1 - p0
    if Prime.prime?(p2) &&
       p0d == p1.to_s.chars.sort &&
       p0d == p2.to_s.chars.sort
      puts "%d%d%d" % [p0,p1,p2]
      exit
    end
  end
end

# A faster appraoch would be...
# (1489..9999).each do |p0|
#   next unless Prime.prime?(p0)
#   perms = permuations_of(p0)
#   perms.find_all{|p| p > p0}
#   next if perms.size < 2
#   perms[0..-2].each do |p1|
#     p2 = 2*p1 - p0
#     next unless perms.include?(p2)
#     puts "%d%d%d" % [p0,p1,p2]
#     exit
#   end
# end
#
# ... but I couldn't be bothered to write permutations_of.    
