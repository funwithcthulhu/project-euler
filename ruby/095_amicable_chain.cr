require "benchmark"

def divisors(number : Int32)
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

def amicable_chain(number, sstart, n = 1)
  return 0 if number < 2
  return 0 if n > 30
  return 0 if number > 1_000_000
  possible = divisors(number).sum
  return n if possible == sstart && n > 1
  n += 1
  amicable_chain(possible, sstart, n)
end

def search(low, lim)
  count = 0
  number = 0
  (low..lim).each do |candidate|
    n = amicable_chain(candidate, candidate)
    if n > count
      count = n
      number = candidate
    end
  end
  puts "longest chain: #{count}, least member: #{number}"
end

Benchmark.bm do |x|
  x.report("result: ") { search(ARGV[0].to_i, ARGV[1].to_i) }
end

# user     system      total        real
# result:  longest chain: 28, least member: 14316
# 18.500000   1.600000   20.100000 (  19.096770)
