def palindrome?(s)
  !s.end_with?('0') && s == s.reverse
end

def pal?(n,base)
  palindrome?(n.to_s(base))
end

puts (1..1_000_000).find_all{|n| pal?(n,10) && pal?(n,2)}.reduce(:+)
