max = 0
999.downto(100).each do |x|
  x.downto(100).each do |y|
    p = x*y
    ps = p.to_s
    max = p if p > max && ps == ps.reverse
  end
end
puts max
