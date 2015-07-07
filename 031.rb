# Ruby version (2.755 ms)...
MEMO={}
def combos(n, coins)
  return 1 unless n > 0
  MEMO[[n, coins]] ||= coins.select{|c| c <= n}.map{|c| combos(n - c, coins.select{|c2| c2 <= c})}.reduce(:+)
end
puts combos(200, [200, 100, 50, 20, 10, 5, 2, 1])



# More robust and faster (1.295 ms) ...
MEMO={}
COINS=[1, 2, 5, 10, 20, 50, 100, 200] # sorted
MIN_COIN = 1
def combos(n, m)
  MEMO[[n, m]] ||= begin
    if n == 0
      1
    elsif n < MIN_COIN
      0
    else
      sum = 0
      m.times do |i|
        c = COINS[i]
        break if c > n
        sum += combos(n - c, i+1)
      end
      sum
    end
  end
end
puts combos(200, COINS.size)

