ONE = [1,2,3,4,5,6,7,8,9].permutation(1).to_a.map { |x| x.join.to_i }
TWO = [1,2,3,4,5,6,7,8,9].permutation(2).to_a.map { |x| x.join.to_i }
THREE = [1,2,3,4,5,6,7,8,9].permutation(3).to_a.map { |x| x.join.to_i }
FOUR = [1,2,3,4,5,6,7,8,9].permutation(4).to_a.map { |x| x.join.to_i }
FIVE = [1,2,3,4,5,6,7,8,9].permutation(5).to_a.map { |x| x.join.to_i }
SIX = [1,2,3,4,5,6,7,8,9].permutation(6).to_a.map { |x| x.join.to_i }
SEVEN = [1,2,3,4,5,6,7,8,9].permutation(7).to_a.map { |x| x.join.to_i }
EIGHT = [1,2,3,4,5,6,7,8,9].permutation(8).to_a.map { |x| x.join.to_i }

SARRAY = [ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT].flatten!

def pandigital?(a, b, c)
  source = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  candidate = (a.to_s + b.to_s + c.to_s).split(//).map(&:to_i).sort
  source == candidate
end

$sum = 0

SARRAY.each do |a|
  SARRAY.each do |b|
    temp = a * b
    if pandigital?(a, b, temp)
      puts "#{a} x #{b} = #{temp}"
      $sum += temp
    end
  end
end
