# Project Euler # 99

biggest_line = 0
current_line = 1
biggest = 0
File.open("p099_base_exp.txt").each_line do |line|
   temp = line.split(',').map(&:to_i)
   num = temp[1] * Math.log(temp[0])
   if num > biggest
     biggest = num
     biggest_line = current_line
   end
   current_line += 1
end
puts biggest_line
