start = Time.now

def cat(*digits)
  digits.reduce(0){|a,d| a*10 + d}
end

sum = 0
D = [0,1,2,3,4,5,6,7,8,9]
D.each do |d10|
  d10a = [d10]
  (D - d10a).each do |d9|
    d9a = [d9] + d10a
    (D - d9a).each do |d8|
      next unless cat(d8,d9,d10) % 17 == 0
      d8a = [d8] + d9a
      (D - d8a).each do |d7|
        next unless cat(d7,d8,d9) % 13 == 0
        d7a = [d7] + d8a
        ([0,5] - d7a).each do |d6|
          next unless cat(d6,d7,d8) % 11 == 0
          d6a = [d6] + d7a
          (D - d6a).each do |d5|
            next unless cat(d5,d6,d7) % 7 == 0
            d5a = [d5] + d6a
            ([0,2,4,6,8] - d5a).each do |d4|
              # next unless cat(d4,d5,d6) % 5 == 0
              d4a = [d4] + d5a
              m = case ((d4 + d5) % 3)
                  when 0
                    [0,3,6,9]
                  when 1
                    [2,5,8]
                  when 2
                    [1,4,7]
                  end
              (m - d4a).each do |d3|
                # next unless cat(d3,d4,d5) % 3 == 0
                d3a = [d3] + d4a
                (D - d3a).each do |d2|
                  # next unless cat(d2,d3,d4) % 2 == 0
                  d2a = [d2] + d3a
                  d1 = (D - d2a)[0]
                  sum += cat(d1, *d2a)
                end
              end
            end
          end
        end
      end
    end
  end
end  

puts sum
puts (Time.now - start)*1000
