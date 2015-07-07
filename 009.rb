# a + b + c = 1000
# a < b < c
# a*a + b*b == c*c
# find a*b*c

(1..1000).each do |a|
  (a..1000).each do |b|
    c = 1000 - a - b
    if a*a + b*b == c*c
       puts "a: #{a}, b: #{b}, c: #{c}"
       puts a*b*c
       exit(0)
    end
  end
end   
