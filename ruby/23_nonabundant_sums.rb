def divisors(number)
  (1..Math.sqrt(number)).select do |val|
    (number % val).zero?
  end.inject([]) do |arr, i|
    arr << i
    arr << number / i unless i == number / i
    arr
  end.sort.delete_if { |n| n == number }
end

def abundant?(number)
  div = divisors(number)
  div.empty? ? false : div.inject(:+) > number
end

ABUNDANT = (1..28123).select { |num| abundant?(num) }

def abundant_sum?(number)
  ABUNDANT.any? { |a| ABUNDANT.any? { |b| a + b == number }}
end

MAX = 28123

def sum_pos_ints(max)
  result_array = []
  (1..max).reject { |int| abundant_sum?(int) }
end

sum_pos_ints(MAX).inject(:+)

