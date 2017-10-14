# The 5-digit number, 16807=75, is also a fifth power.
# Similarly, the 9-digit number, 134217728=89, is a ninth power.
# How many n-digit positive integers exist which are also an nth power?

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