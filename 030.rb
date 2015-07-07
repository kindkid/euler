puts (2 .. 1_000_000).select{|i| i == i.to_s.chars.map(&:to_i).reduce(0){|a, b| a + b**5}}.reduce(:+)
