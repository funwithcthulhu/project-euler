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

def amicable_chain(number, sstart, n = 1)
  return nil if number < 2
  return nil if n > 30
  return nil if number > 1_000_000
  possible = divisors(number).sum
  return n if possible == sstart && n > 1
  n += 1
  amicable_chain(possible, sstart, n)
end

def search(low, lim)
  count = 0
  number = 0
  (low..lim).each do |candidate|
    n = amicable_chain(candidate, candidate) || 0
    if n > count
      count = n
      number = candidate
    end
  end
  puts "longest chain: #{count}, least member: #{number}"
end

Benchmark.bm do |x|
  x.report { search(100, 20_000)}
end
# irb(main):080:0> search(20_000)
# longest chain: 5, least member: 12496