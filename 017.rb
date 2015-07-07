L = {}
%w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen).each_with_index do |s, i|
  next if i == 0
  L[i] = s.length
end
%w(zero ten twenty thirty forty fifty sixty seventy eighty ninety).each_with_index do |s, i|
  next if i < 2
  L[i*10] = s.length
  (1..9).each do |o|
    L[i*10 + o] = L[i*10] + L[o]
  end
end
L[0] = 0

puts 'onethousand'.length +
'hundred'.length * 900 +
'and'.length * (900-9) + 
(1..9).map{|i| (L[i]) * 100}.reduce(:+) +
(0..99).reduce(0){|a,i| a + L[i]} * 10
