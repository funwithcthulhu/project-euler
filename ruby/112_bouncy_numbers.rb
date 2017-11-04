# Project Euler Problem 112: Bouncy Numbers
#
# Working from left-to-right if no digit is exceeded by the digit to its left
# it is called an increasing number; for example, 134468.

# Similarly if no digit is exceeded by the digit to its right it is called a
# decreasing number; for example, 66420.

# We shall call a positive integer that is neither increasing nor decreasing a
# "bouncy" number; for example, 155349.

# Clearly there cannot be any bouncy numbers below one-hundred, but just over half
# of the numbers below one-thousand (525) are bouncy. In fact, the least number for
# which the proportion of bouncy numbers first reaches 50% is 538.

# Surprisingly, bouncy numbers become more and more common and by the time we reach
# 21780 the proportion of bouncy numbers is equal to 90%.

# Find the least number for which the proportion of bouncy numbers is exactly 99%.

require 'benchmark'

def incr(number)
  arr = number.to_s.split(//).map(&:to_i)
  arr == arr.sort
end

def decr(number)
  arr = number.to_s.split(//).map(&:to_i)
  arr == arr.sort.reverse
end

def tab(proportion)
  non = 0
  bouncy = 0
  last = 0
  (1..Float::INFINITY).each do |candidate|
    if incr(candidate) || decr(candidate)
      non += 1 
    else
      bouncy += 1
    end
    last = candidate
    break if bouncy.to_f / (non.to_f + bouncy.to_f) == proportion
  end
  puts last
end

Benchmark.bm do |x|
  x.report("50%: ") { tab(0.5) }
  x.report("90%: ") { tab(0.9) }
  x.report("99%: ") { tab(0.99) }
end

# user     system      total        real
# 50%: 538
#  0.010000   0.000000   0.010000 (  0.003865)
# 90%: 21780
#  0.220000   0.000000   0.220000 (  0.231804)
# 99%: 1587000
# 20.450000   0.070000  20.520000 ( 20.608861)