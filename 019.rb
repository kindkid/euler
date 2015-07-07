# How many Sundays fell on the first of the month during the 20th century (1901-01-01 to 2000-12-31)?

def days(year, month)
  case month
  when 1,3,5,7,8,10,12
    31
  when 4,6,9,11
    30
  when 2
    if year % 400 == 0
      29
    elsif year % 100 == 0
      28
    elsif year % 4 == 0
      29
    else
      28
    end
  end
end

sunday1s = 0
day_of_week = 1
(1900 .. 2000).each do |year|
  (1 .. 12).each do |month|
    if year > 1900 && day_of_week == 0
      sunday1s += 1
    end
    day_of_week = (day_of_week + days(year, month)) % 7
  end
end

puts sunday1s
