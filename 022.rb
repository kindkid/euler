A = 'A'.codepoints.first
def score(name)
  name.upcase.codepoints.map{|c| 1 + c - A}.reduce(:+)
end
puts open('022-names.txt'){|f| f.read.split(/[\s,]+/)}.
map{|n| n.gsub('"','')}.
sort.
each_with_index.
map{|name, i| score(name) * (i+1)}.
reduce(:+)
