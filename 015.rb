rows = 20
cols = 20
a = [[nil] * (cols+1)] * (rows+1)
a[0][0] = 1
(0..rows).each do |r|
  (0..cols).each do |c|
    next if r == 0 && c == 0
    a[r][c] = ((r > 0) ? a[r-1][c] : 0) +
              ((c > 0) ? a[r][c-1] : 0)
  end
end
puts a[rows][cols]
