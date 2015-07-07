start = Time.now
result = (1..1000).reduce(0){|a,n| a + n**n} % 10 ** 10
finish= Time.now
puts result
puts (finish - start) * 1000
