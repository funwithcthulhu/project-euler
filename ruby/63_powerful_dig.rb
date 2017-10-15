# The 5-digit number, 16807=75, is also a fifth power.
# Similarly, the 9-digit number, 134217728=89, is a ninth power.
# How many n-digit positive integers exist which are also an nth power?

#  I initially iterated from 0..1_000 in the outside loop,
# and 1.. 10 on the inside loop. Figured out quick from
# the printed output that n can't be greater than 9, and narrowed
# the possible values of the exponent down as well, all through
# trial and error. Project Euler kept telling me my answer was
# wrong, and I couldn't figure out why, until I realized I was
# counting 0^1 in my tally.

count = 0
(1..9).each do |x|
  (1..25).each do |y|
    if (x**y).to_s.size == y
      puts "#{x}^#{y} = #{x**y}"
      count += 1
    end
  end
end
puts count