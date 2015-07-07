# Which integer p <= 1000 has the most number of unique right triangles
# with sides of integer length {a,b,c}, where a + b + c = p?

max_count = 0
max_p = 0
(3..1000).each do |p|
  count = 0
  (1..(p/4)).each do |a|
    (a..((p-a)/2)).each do |b|
      c = p - a - b
      count +=1 if a**2 + b**2 == c**2
    end
  end
  if count > max_count
    max_count = count
    max_p = p
  end
end

puts max_p
