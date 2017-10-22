# Some memoization cuts time off 100k upper limit by 10 seconds...blech

require 'benchmark'

def divisors(number)
  (1..Math.sqrt(number)).select do |val|
    (number % val).zero?
  end.inject([]) do |arr, i|
    arr << i
    arr << number / i unless i == number / i
    arr
  end.sort.delete_if { |x| x == number }
end

Cache = {}

def amicable_chain(number, sstart, n = 1, arr = [])
  arr << number
  if Cache.key?(number)
    return Cache[number]
  end
  if number < 2
    Cache[sstart] = 0
    return 0
  end
  if n > 30
    Cache[sstart] = 0
    return 0
  end
  if number > 1_000_000
    Cache[sstart] = 0
    return 0
  end
  possible = divisors(number).sum
  return n if possible == sstart && n > 1
  n += 1
  amicable_chain(possible, sstart, n, arr)
end

def search(low, lim)
  count = 0
  number = 0
  (low..lim).each do |candidate|
    if Cache.key?(candidate)
      n = Cache[candidate]
    else
      n = amicable_chain(candidate, candidate, 1)
    end
    if n > count
      count = n
      number = candidate
    end
  end
  puts "longest chain: #{count}, least member: #{number}"
end

Benchmark.bm do |x|
  x.report { search(100, 100_000)}
end
# irb(main):080:0> search(20_000)
# longest chain: 5, least member: 12496