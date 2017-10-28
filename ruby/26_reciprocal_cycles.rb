# Project Euler Problem 26
#
# A unit fraction contains 1 in the numerator.
#
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle.
# It can be seen that 1/7 has a 6-digit recurring cycle.
#
# Find the value of d < 1000 for which 1/d contains the longest
# recurring cycle in its decimal fraction part.

Cache = {}

# Keeps track of the remainder, and returns the size of the 
# decimal as soon as the remainder repeats itself
#
# Currently has a bug with some even numbers
def recurring(n, p = 20, counter = 1, divisor = 1, cache = [])
  if (1.0/n.to_f).round(20).to_s.size <= 12
    return (1.0/n.to_f).to_s.split('.')[1].size
  end
  divisor *= 10
  temp_d = divisor / n
  remainder = divisor - (temp_d * n)
  return cache.size if cache.include?(remainder)
  cache << remainder
  divisor = remainder
  counter += 1
  recurring(n, p, counter, divisor, cache)
end

(1..1000).each { |v| Cache[v] = recurring(v) }
Cache.key(Cache.values.max)
# => 983

## Below code brute forces the solution (too time consuming)
def divide(n, p = 20, counter = 1, divisor = 1, decimal = [])
  # baseline
  return decimal.join if counter > p
  # accounts for cases such as 1/8 = 0.125 which otherwise break the program
  if (1.0/n.to_f).round(20).to_s.size <= 12
    return (1.0/n.to_f).to_s.split('.')[1]
  end
  divisor *= 10
  until !(divisor / n).zero?
    divisor *= 10
    decimal << 0
  end
  temp_d = divisor / n
  remainder = divisor - (temp_d * n)
  decimal << temp_d
  divisor = remainder
  counter += 1
  divide(n, p, counter, divisor, decimal)
end

def longest(text)
  (text.length/2).downto 1 do |l|
    match = Regexp.new("(.{#{l}})\\1").match(text)
    if match
      return text[match.offset(1)[0]..(match.offset(1)[1]-1)]
    elsif !match && l.to_s.size <2
      return '0'
    end
  end
end

def find(beg, limit)
  (1..limit).each do |n|
    next unless divide(n,1).size != divide(n, 2).size
    k = 2
    while longest(divide(n,k)).size == 1
      k += 1
    end
    Cache[n] = longest(divide(n, k)).size
  end
end
