curiosities = []
(10..98).each do |n|
  ((n+1)..99).each do |d|
    n1 = n % 10
    d1 = d % 10
    next if n1 == 0 && d1 == 0
    n0 = n / 10
    d0 = d / 10
    if (n0 == d0 && n1/d1.to_f == n/d.to_f) ||
       (n0 == d1 && n1/d0.to_f == n/d.to_f) ||
       (n1 == d0 && n0/d1.to_f == n/d.to_f) ||
       (n1 == d1 && n0/d0.to_f == n/d.to_f)
      curiosities << [n, d]
    end
  end
end
puts curiosities.inspect
puts Rational(curiosities.map(&:first).reduce(:*), curiosities.map(&:last).reduce(:*))
