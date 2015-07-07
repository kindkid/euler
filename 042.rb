def wordvalue(w)
  w.upcase.codepoints.map{|c| c - 64}.reduce(:+)
end

TRI = {}
t, n = 0, 1
while t < 26*50
  t = (n+1)*n/2
  TRI[t] = true
  n += 1
end

count = 0
File.open('042-words.txt') {|f| f.read}.split(/[^\w']/).each do |word|
  word.strip!
  next if word.size == 0
  count += 1 if TRI[wordvalue(word)]
end
puts count
