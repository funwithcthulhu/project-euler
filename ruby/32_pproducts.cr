ONE = [1_i64,2_i64,3_i64,4_i64,5_i64,6_i64,7_i64,8_i64,9_i64].permutations(1_i64).to_a.map { |x| x.join.to_i64 }
TWO = [1_i64,2_i64,3_i64,4_i64,5_i64,6_i64,7_i64,8_i64,9_i64].permutations(2_i64).to_a.map { |x| x.join.to_i64 }
THREE = [1_i64,2_i64,3_i64,4_i64,5_i64,6_i64,7_i64,8_i64,9_i64].permutations(3_i64).to_a.map { |x| x.join.to_i64 }
FOUR = [1_i64,2_i64,3_i64,4_i64,5_i64,6_i64,7_i64,8_i64,9_i64].permutations(4_i64).to_a.map { |x| x.join.to_i64 }
FIVE = [1_i64,2_i64,3_i64,4_i64,5_i64,6_i64,7_i64,8_i64,9_i64].permutations(5_i64).to_a.map { |x| x.join.to_i64 }
SIX = [1_i64,2_i64,3_i64,4_i64,5_i64,6_i64,7_i64,8_i64,9_i64].permutations(6_i64).to_a.map { |x| x.join.to_i64 }
SEVEN = [1_i64,2_i64,3_i64,4_i64,5_i64,6_i64,7_i64,8_i64,9_i64].permutations(7_i64).to_a.map { |x| x.join.to_i64 }
EIGHT = [1_i64,2_i64,3_i64,4_i64,5_i64,6_i64,7_i64,8_i64,9_i64].permutations(8_i64).to_a.map { |x| x.join.to_i64 }

SARRAY = [ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT].flatten

def pandigital?(a : Int64, b : Int64, c : Int64)
  source = [1_i64, 2_i64, 3_i64, 4, 5_i64, 6, 7_i64, 8_i64, 9_i64]
  candidate = (a.to_s + b.to_s + c.to_s).split(//).map(&.to_i64).sort
  source == candidate
end

def find
  sum = [] of Int64
  SARRAY.each do |a|
    SARRAY.each do |b|
      temp = a * b
      if pandigital?(a, b, temp)
        sum << temp 
        puts "#{a} x #{b} = #{temp}"
      end
    end
  end
  puts sum.uniq.sum
end

find
# 08:12:05 ruby $ ./32_pproducts
# 4 x 1738 = 6952
# 4 x 1963 = 7852
# 12 x 483 = 5796
# 18 x 297 = 5346
# 27 x 198 = 5346
# 28 x 157 = 4396
# 39 x 186 = 7254
# 42 x 138 = 5796
# 48 x 159 = 7632
# 138 x 42 = 5796
# 157 x 28 = 4396
# 159 x 48 = 7632
# 186 x 39 = 7254
# 198 x 27 = 5346
# 297 x 18 = 5346
# 483 x 12 = 5796

# irb(main):001:0> sum = 0
# irb(main):002:0> sum += 6952
# irb(main):003:0> sum += 7852
# irb(main):004:0> sum += 5796
# irb(main):005:0> sum += 5346
# irb(main):006:0> sum += 4396
# irb(main):007:0> sum += 7254
# irb(main):008:0> sum += 7632
# => 45228
