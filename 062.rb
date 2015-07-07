require 'set'

def digits(n)
  result = []
  while n > 0
    result << (n % 10)
    n /= 10
  end
  return result
end

permutations = 5
start = Time.now
h = Hash.new{|h,k| h[k] = Set.new}
i = 0
consider = []
digits_so_far = 0
loop do
  i += 1
  c = i*i*i
  d = digits(c)
  if d.size > digits_so_far
    consider.each do |s|
      if s.size == permutations
        puts s.min
        puts "Finished in %dms" % ((Time.now - start) * 1000)
        exit
      end
    end
    consider = []
    digits_so_far = d.size
  end
  s = h[d.sort]
  s << c
  if s.size == permutations
    consider << s
  end
end

