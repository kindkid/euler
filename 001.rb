puts 1000.times.reduce(0){|a, n| a + (((n % 3 == 0) || (n % 5 == 0)) ? n : 0)}
