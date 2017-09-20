# Project Euler problem 13
# Sums one hundred 50-digit numbers found in a file ("p13_bignum.txt")

# Reads each line, which corresponds to each number, as a string
# adds each string to an array
# then, converts each string to a number and sums the array
def sum(filename)
  summation = []
  File.open(filename).readlines.each do |line|
    summation << line
  end
  summation.map(&:to_i).inject(:+)
end

# irb(main):029:0> sum("p13_bignum.txt")
# => 5537376230390876637302048746832985971773659831892672