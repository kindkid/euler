# Find the sum of all numbers which are equal to the sum of the factorial of
# their digits. (1 and 2 are excluded, as they are not sums)

# Let's find an upper bound.
# If every digit of a number is 9 we'll get the maximum sum for that number of
# digits. When the maximum sum has less digits than we started with, we know we
# already have too many digits. Well, 8*9! has only 7 digits, which means 8
# digits is too many. So, the maximum 7 digit number would be 7*9! (that is,
# 2540160), which seems small enough to brute force.

F = [1,1]
(2..9).each do |i|
  F[i] = i * F[i-1]
end
def digits(n); n.to_s.chars.map(&:to_i); end
def s(n); digits(n).map{|d| F[d]}.reduce(:+); end

sum = 0
i = 3
while i < 2_540_160
  c = s(i)
  if i == c
    STDOUT.write "#{i} "
    sum += i
  end
  i += 1
end
puts
puts "Answer: #{sum}"
