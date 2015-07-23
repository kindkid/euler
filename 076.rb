#!/usr/bin/env ruby
# It is possible to write five as a sum in exactly six different ways:
# 
# 4 + 1
# 3 + 2
# 3 + 1 + 1
# 2 + 2 + 1
# 2 + 1 + 1 + 1
# 1 + 1 + 1 + 1 + 1
#
# How many different ways can one hundred be written as a sum of at least two
# positive integers?

TARGET=100
CALLS=[0]
WAYS={}
# s: the sum the terms add up to
# m: max value for any term
def ways(s,m)
  CALLS[0] += 1
  return 1 if s == 0
  return 0 if m == 0
  return 1 if m == 1
  WAYS[[s,m]] ||= ways(s,m-1) + ways(s-m,[s-m,m].min)
end

puts ways(TARGET, TARGET-1) # answer
puts CALLS[0]               # TARGET*TARGET/2 -1

# notes used to eyeball the recursion
# -----------------------------------
1

2
1+1

3
2+1
1+1+1

4
3+1
2+2
2+1+1
1+1+1+1

5
4+1
3+2
3+1+1
2+2+1
2+1+1+1
1+1+1+1+1

6
5+1
4+2
4+1+1
3+3
3+2+1
3+1+1+1
2+2+2
2+2+1+1
2+1+1+1+1
1+1+1+1+1+1

7
6+1
5+2
5+1+1
4+3
4+2+1
4+1+1+1
3+3+1
3+2+2
3+2+1+1
3+1+1+1+1
2+2+2+1
2+2+1+1+1
2+1+1+1+1+1
1+1+1+1+1+1+1

8
7+1
6+2
6+1+1
5+3
5+2+1
5+1+1+1
4+4
4+3+1
4+2+2
4+2+1+1
4+1+1+1+1
3+3+2
3+3+1+1
3+2+2+1
3+2+1+1+1
3+1+1+1+1+1
2+2+2+2
2+2+2+1+1
2+2+1+1+1+1
2+1+1+1+1+1+1
1+1+1+1+1+1+1+1
