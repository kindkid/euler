def rank(card)
  r = card[0]
  Integer(r)
rescue ArgumentError
  case r
  when 'T'
    10
  when 'J'
    11
  when 'Q'
    12
  when 'K'
    13
  when 'A'
    14
  else
    raise "weird card!"
  end
end

def suit(card)
  card[1]
end

def straight?(ranks, high)
  ((-4..0).map{|i| high + i} - ranks).empty?
end
  

def sort_value(cards)
  ranks = cards.map{|c| rank(c)}.sort
  suits = cards.map{|c| suit(c)}
  high = ranks.last
  if (suits - [suits.first]).empty? # flush
    if straight?(ranks, high)
      if high == 14
        return [10, "royal flush"]
      else
        return [9, high, "straight flush"]
      end
    end
    return [6, *ranks.reverse, "flush"]
  end
  rank_count = Hash.new{|h,k| h[k] = 0}
  ranks.each{ |r| rank_count[r] += 1 }
  count_rank = rank_count.map{|r,c| [c,r]}.sort.reverse
  case count_rank[0][0] # largest count
  when 4
    return [8, count_rank, "four-of-a-kind"]
  when 3
    if count_rank[1][0] == 2
      return [7, count_rank, "full house"]
    else
      return [4, count_rank, "three-of-a-kind"]
    end
  when 2
    if count_rank[1][0] == 2
      return [3, count_rank, "two pair"]
    else
      return [2, count_rank, "one pair"]
    end
  when 1
    if straight?(ranks, high)
      return [5, high, "straight"]
    else
      return [1, count_rank, "high card"]
    end
  else
    raise "cheater!"
  end
end  

wins = 0
File.open('054-poker.txt') do |f|
  f.lines do |line|
    cards = line.strip.split(' ')
    player1 = cards.take(5)
    player2 = cards.drop(5)
    value1 = sort_value(player1)
    value2 = sort_value(player2)
    hand1 = value1.last
    hand2 = value2.last
    case value1 <=> value2
    when 1
      result = "Win"
      wins += 1
    when 0
      result = "TIE!!"
    when -1
      result = "Loss"
    end
    puts "%s %20s : %s %20s : %s" % [player1.inspect,
                                     hand1,
                                     player2.inspect,
                                     hand2,
                                     result]
  end
end
puts wins
