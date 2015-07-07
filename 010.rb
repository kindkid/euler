n = 2_000_000
marked = [false] * n
sum = 0
(2..n).each do |i|
  next if marked[i]
  sum += i
  (i..n).step(i) do |j|
    marked[j] = true
  end
end
puts sum
