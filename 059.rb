require 'set'

USUAL = Set.new('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz01234567890 .'.chars)

def decrypt(bytes, key)
  unusual = 0
  result = ""
  key_len = key.length
  i = 0
  spaces = 0
  bytes.each do |b|
    char = (b ^ key[i]).chr
    result << char
    spaces += 1 if char == ' '
    unusual += 1 unless USUAL.include?(char)
    #return ["NO",1] if result.length > 80 && spaces < result.length / 8
    i = (i + 1) % key_len
  end
  [result, (unusual.to_f / result.length)]
end

cipher = STDIN.read.strip.split(/[\s,]+/).map(&:to_i)

chars = 'abcdefghijklmnopqrstuvwxyz'.bytes.to_a

best = nil
best_text = nil
least_strange = 1
chars.each do |a|
  chars.each do |b|
    chars.each do |c|
      key = [a,b,c]
      plain, strangeness = decrypt(cipher, key)
      if strangeness < least_strange
        best = key
        best_text = plain
        least_strange = strangeness
      end
    end
  end
end
if best
  key = best
  puts "#{key.map(&:chr).join}: #{best_text.bytes.reduce(:+)} : #{best_text}"
end
