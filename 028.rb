MEMO = []
MEMO[1] = 1
def diagonal_spiral_sum(n)
  MEMO[n] ||= begin
    x = n-2
    y = x**2
    z = n-1
    (1..4).map{|i| y + i*z}.reduce(:+) + 
    diagonal_spiral_sum(n-2)
  end
end

puts diagonal_spiral_sum(1001)
