# What is the largest prime number with n digits which contains all the digits 1
# to n exactly once?

# Thoughts:
#   All multi-digit prime numbers end with 1,3,7, or 9.
#   If the sum of a number's digits is divisible by 3, so is the number. 
#   All 9,8,6,5,3, and 2-digit pandigital numbers are divisible by 3.
#   So, that just leaves the 4-digit and 7-digit pandigitals to test.
#   Small enough to brute force, let's go!


def prime?(n)
  return false if n == 1
  (2..Math.sqrt(n)).each do |i|
    return false if n % i == 0 && i < n
  end
  true
end

D = [7,6,5,4,3,2,1]

start = Time.now
D.each do |a|
  (D - [a]).each do |b|
    ab = [a,b]
    (D - ab).each do |c|
      abc = [a,b,c]
      (D - abc).each do |d|
        abcd = [a,b,c,d]
        next if ([1,3,7] - abcd).empty?
        (D - abcd).each do |e|
          abcde = [a,b,c,d,e]
          next if ([1,3,7] - abcde).empty?
          (D - abcde).each do |f|
            abcdef = [a,b,c,d,e,f]
            g = (D - abcdef)[0]
            next unless [1,3,7].include?(g)
            n = [a,b,c,d,e,f,g].reduce(0) {|a,x| a*10 + x}
            if prime?(n)
              finish = Time.now
              puts n
              puts (finish - start) * 1000
              exit
            end
          end
        end
      end
    end
  end
end            
