#!/usr/bin/env ruby

# A common security method used for online banking is to ask the user for three
# random characters from a passcode. For example, if the passcode was 531278,
# they may ask for the 2nd, 3rd, and 5th characters; the expected reply would
# be: 317.
#
# The text file, keylog.txt, contains fifty successful login attempts.
#
# Given that the three characters are always asked for in order, analyse the
# file so as to determine the shortest possible secret passcode of unknown
# length.

File.open('079-keylog.txt') do |f|
  entries = f.each_line.map{|line| line.strip.to_s.chars.map(&:to_i)}
  pairs = {}
  entries.each do |entry|
    [entry[0..1], entry[1..2]].each do |pair|
      if pairs[pair.reverse]
        puts "#{pair} occured reversed. Can't do it the easy way."
        exit
      end
      pairs[pair] = true
    end
  end
  puts pairs.keys.sort.inspect
end

# The rest can be done more quickly via inspection than writing code: 7 3 1 6 2 8 9 0
