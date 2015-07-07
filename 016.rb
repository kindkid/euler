puts (2**1000).to_s.chars.reduce(0){|a, i| a + i.to_i}
