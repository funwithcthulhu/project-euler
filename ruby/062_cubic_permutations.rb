# Project Euler Problem 62
# Cubic Permutations

# The cube, 41063625 (3453), can be permuted to produce two
# other cubes: 56623104 (3843) and 66430125 (4053). In fact,
# 41063625 is the smallest cube which has exactly three permutations
# of its digits which are also cube.

# Find the smallest cube for which exactly five permutations
# of its digits are cube.

cache = Hash.new { |hash, key| hash[key] = [] }

(2..Float::INFINITY).each do |x|
  sq = x**3
  ordered = sq.to_s.chars.sort.join
  cache[ordered] << sq
  if cache[ordered].size == 5
    pp cache[ordered].sort.first
    break
  end
end
