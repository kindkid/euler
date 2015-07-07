# Output
#
# 4075
# Total time: 0.068ms

start = Time.now
count = 0

# FAC = [1]
# def fac(n)
#   FAC[n] ||= (n * fac(n-1))
# end
#
# def n_choose_r(n,r)
#   fac(n) / fac(r) / fac(n-r)
# end
#
# (23..100).each do |n|
#   (0..n).each do |r|
#     if n_choose_r(n,r) > 1_000_000
#      count += (n - 2*r + 1)
#      break
#     end
#   end
# end

(23..100).each do |n|
  nCr = n
  (2..n).each do |r|
    nCr *= (n - r + 1) / r
    if nCr > 1_000_000
      count += (n - 2*r + 1)
      break
    end
  end
end   

finish = Time.now
puts count

puts "Total time: %1.3fms" % ((finish - start) * 1000)
