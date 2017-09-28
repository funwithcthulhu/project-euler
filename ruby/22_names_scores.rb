name_arr = File.open('p022_names.txt').readlines.join.split('"').delete_if { |x| x == ","}.sort!
total = 0

name_arr.each_with_index do |name, idx|
  temp = 0
  name.split(//).each do |letter|
    temp += (letter.ord % 64)
  end
  total += (temp * (idx))
end
total
 
# irb(main):040:0> total
# => 871198282