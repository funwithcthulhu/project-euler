# Project Euler problem 23 - Non-abundant sum
# Sum all positive integers which themselves are not the sum of two abundant numbers
#
# Naive solution. I ended up transforming the problem into the subset sum problem, which is 
# NP complete.
# This program took approx 9:30 minutes to get the answer
#
# All numbers after 28123 can be created by summing two abundant numbers, which is 
# why the range stops there.
#
# Sieve algorithm which runs in a couple seconds is implemented at the bottom
# 

# Optimized method to find all divisors of a number
# Theta(sqrt(n)) time, returns an array
def divisors(number : Int)
  arr = (1..Math.sqrt(number)).select do |val|
    (number % val).zero?
  end
  new_arr = [] of Int32
  arr.each do |val|
    new_arr << val
    new_arr << number / val unless val == number / val
  end
  new_arr.sort!.delete(number)
  return new_arr
end

# Method sums a numbers divisors to determine if the input
# is an abundant number or not
def abundant?(number)
  div = divisors(number)
  div.empty? ? false : div.sum > number
end

# Constant array which is composed of all abundant numbers
# up to 28123, inclusive
ABUNDANT = (1..28123).select { |num| abundant?(num) }

# Checks if two numbers in the ABUNDANT array sum to the input
# Essentially this is the subset sum problem
def abundant_sum?(number)
  ABUNDANT.any? { |a| ABUNDANT.any? { |b| a + b == number }}
end

# iterates over a range, rejecting numbers which
# can be summed from 2 abundant numbers, then sums them
def sum_pos_ints(max)
  (1..max).reject { |int| abundant_sum?(int) }.sum
end

#puts sum_pos_ints(28123)

# $ crystal 23_abundant_sum.cr
# 4179871

# Sieve algorithm, runs in a couple seconds

def non_abundant_sum(max)
  result_arr = [] of Int32
  ABUNDANT.each_with_index do |a, i|
    ABUNDANT[i..-1].each do |b|
      c = a + b
      break if c > max
      result_arr << c
    end
  end
  result_arr.uniq!
  (1..max).select { |n| !result_arr.includes?(n) }.sum
end

puts non_abundant_sum(28123)

# $ crystal 23_nonabundant_sum.cr
# 4179871