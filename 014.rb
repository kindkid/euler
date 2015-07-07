lengths = {0 => 0, 1 => 1}
max_length = 0
max_s = 0
1_000_000.times do |s|
  n = s
  c = 0
  while n != 1 && ! lengths.include?(n)
    c += 1
    if n % 2 == 0
      n /= 2
    else
      n = 3*n + 1
    end
  end
  lengths[s] = lengths[n] + c
  if lengths[s] > max_length
    max_length = lengths[s]
    max_s = s
  end
end

puts max_s
