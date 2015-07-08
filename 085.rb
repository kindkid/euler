#!/usr/bin/env ruby

# By counting carefully it can be seen that a rectangular grid measuring 3 by
# 2 contains eighteen rectangles.
#
# Although there exists no rectangular grid that contains exactly two million
# rectangles, find the area of the grid with the nearest solution.
# ----------------------------------------------------------------------------
# Analysis: number of rectangles = triangular(width) * triangular(height)

TARGET = 2_000_000
def distance(c)
  (TARGET - c).abs
end

def triangular(n)
  (n+1)*n/2
end

def rectangles(w,h)
  triangular(w) * triangular(h)
end

best_area = 0
best_rectangles = 0
best_distance = TARGET

width = 2000
height = 1
while (width >= height) do
  r = rectangles(width,height)
  d = distance(r)
  if d <= best_distance
    best_distance = d
    best_rectangles = r
    best_area = width * height
  end
  if r > TARGET
    width -= 1
  else
    height += 1
  end
end
puts best_area
puts best_rectangles
