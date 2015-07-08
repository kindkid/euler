#!/usr/bin/env ruby

# In the 5x5 example matrix (081-practice.txt), the minimal path sum from the
# top left to the bottom right, by only moving to the right and down, is equal
# to 2427.
#
# Find the minimal path sum, in matrix.txt, a 31K text file containing a 80 by
# 80 matrix, from the top left to the bottom right by only moving right and
# down.
MATRIX = File.open('081-matrix.txt') do |f|
  f.each_line.map{|line| line.strip.split(',').map(&:to_i)}
end
MIN_SUM = {}
MAX_ROW = MATRIX.length - 1
MAX_COL = MATRIX[0].length - 1
def min_sum(row,col)
  key = [row,col]
  unless MIN_SUM.include?(key)
    result = MATRIX[row][col]
    if row < MAX_ROW
      if col < MAX_COL
        result += [min_sum(row+1,col), min_sum(row,col+1)].min
      else
        result += min_sum(row+1,col)
      end
    elsif col < MAX_COL
      result += min_sum(row,col+1)
    end
    MIN_SUM[key] = result
  end
  return MIN_SUM[key]
end

puts min_sum(0,0)
