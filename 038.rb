# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the
# concatenated product of an integer with (1,2,...,n) where n > 1?

# Thoughts:
# Knowing that n > 1, let's find an upper bound on the common multiplicant.
# catprod(10000,[1,2]) == 1000020000.
# catprod(9999,[1,2]) == 999919998
# So, it must be less than 10000.

largest = 0
(1..9999).each do |i|
  catprod = ""
  need_digit = [false, true, true, true, true, true, true, true, true, true]
  length = 0
  dup_digit = false
  (1..10).each do |j|
    product = j * i
    catprod += product.to_s
    while product > 0
      n = product % 10
      product /= 10
      length += 1
      break if length > 9
      if need_digit[n]
        need_digit[n] = false
      else
        dup_digit = true
        break
      end
    end
    break if dup_digit or length >= 9
  end
  if length == 9
    unless need_digit.any?
      catprod = catprod.to_i(10)
      largest = catprod if catprod > largest
    end
  end
end

puts largest
