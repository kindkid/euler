prev = nil

open('067-triangle.txt'){|f| f.read}.
split("\n").map(&:split).select(&:any?).reverse.each do |row|
  row.map!{|s| s.to_i(10)}
  unless prev.nil?
    row.each_with_index do |v, i|
      row[i] = v + [prev[i], prev[i+1]].max
    end
  end
  prev = row
end
puts prev[0]

