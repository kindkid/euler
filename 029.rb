terms = {}
(2..100).each do |a|
  (2..100).each do |b|
    terms[a**b] = true
  end
end
puts terms.size
