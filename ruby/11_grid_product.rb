GRID = []

File.open("p011_grid.txt").each_line do |line|
  GRID << line.split.map(&:to_i)
end

def left_right
  largest = 0
  GRID.each do |sub_array|
    sub_array.each_cons(4) do |cons|
      temp = cons.inject(:*)
      largest = temp if temp > largest
    end
  end
  puts largest
end

# irb(main):037:0> left_right
# 48477312

def up_down
  largest = 0
  GRID.transpose.each do |sub_array|
    sub_array.each_cons(4) do |cons|
      temp = cons.inject(:*)
      largest = temp if temp > largest
    end
  end
  puts largest
end

# irb(main):061:0> up_down
# 51267216

padding = GRID.size - 1
padded_matrix = []

GRID.each do |row|
  inverse_padding = GRID.size - padding
  padded_matrix << ([nil] * inverse_padding) + row + ([nil] * padding)
  padding -= 1    
end

NGRID = padded_matrix.transpose.map(&:compact)
NGRID.shift
NGRID.delete_if { |arr| arr.size < 4 }
largest = 0
NGRID.each do |sub_array|
  sub_array.each_cons(4) do |cons|
    temp = cons.inject(:*)
    largest = temp if temp > largest
  end
end
puts largest

# irb(main):100:0> puts largest
# 70600674
