require "benchmark"

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


def amicable?(number)
  possible = divisors(number).sum
  divisors(possible).sum == number && possible != number
end

def amicable_sum(limit)
  (2...limit).select do |number|
    amicable?(number)
  end.sum
end

Benchmark.bm do |x|
  x.report("10_000: ") { puts amicable_sum(10_000) }
end

# $ crystal 21_amicable_numbers.cr
# 31626
# Elapsed Time: 00:00:39.6360000 ms
# time logged with benchmark module
#                user     system      total        real
# 10_000:  31626
# 0.040000   0.000000   0.040000 (  0.038844)

# RELEASE COMPILED
#  user     system      total        real
# 10_000:  31626
# 0.010000   0.000000   0.010000 (  0.015846)