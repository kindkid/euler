# Find the value of:
# d(1) * d(10) * d(100) * d(1000) * d(10000) * d(100000) * d(1000000)
# where d(n) is the nth digit of the fractional part of the irrational
# number 0.12345678910111213141516171819202122...
# (which is created by concatenating the positive integers)
# For reference, d(11) = 0

start = Time.now
S = ""
(0..1_000_000).each do |i|
  break if S.length > 1_000_001
  S << i.to_s
end

def d(n)
  S[n].to_i
end


puts d(1) * d(10) * d(100) * d(1000) * d(10000) * d(100000) * d(1000000)

finish = Time.now
puts (finish - start)*1000
