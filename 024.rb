FACTORIAL_MEMO = [0,1]
def factorial(n)
  FACTORIAL_MEMO[n] ||= n * factorial(n-1)
end

def permutation(list, index)
  result = []
  l = list.dup
  while l.any?
    max = factorial(l.size)
    d = max / l.size
    i = index / d
    e = l[i]
    index = index - d * i
    l.delete(e)
    result << e
  end
  result
end

puts permutation((0..9).to_a, 999_999).join('')
