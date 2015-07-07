def cycle(n)
  seen = Hash.new(0)
  d = 1
  c = 0
  until seen[d] > 1
    seen[d] += 1
    c += 1 if seen[d] > 1
    return 0 if d == 0
    d = (d * 10) % n
  end
  c
end

max_i = []
max_c = 0
(1..1000).each do |i|
  c = cycle(i)
  if c == max_c
    max_i << i
  elsif c > max_c
    max_c = c
    max_i = [i]
  end
end

puts max_i.inspect
