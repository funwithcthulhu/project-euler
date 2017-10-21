
POSSIBLE = "0123456789".split(//).permutations(10).to_a.map { |x| x.join }

def sub_string_div?(num)
  return false unless (num[1..3].to_i % 2).zero?
  return false unless (num[2..4].to_i % 3).zero?
  return false unless (num[3..5].to_i % 5).zero?
  return false unless (num[4..6].to_i % 7).zero?
  return false unless (num[5..7].to_i % 11).zero?
  return false unless (num[6..8].to_i % 13).zero?
  return false unless (num[7..9].to_i % 17).zero?
  num
end

ARR = POSSIBLE.select do |string|
  sub_string_div?(string)
end

p ARR.map(&.to_i).sum
