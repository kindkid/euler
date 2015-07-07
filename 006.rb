n = 100
puts ( (1..n).reduce(:+) ** 2 ) - (1..n).reduce(0){|a,i| a + i**2}
