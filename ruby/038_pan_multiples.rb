require 'benchmark'

def mult(n)
  parse = ->(x) { x.split(//).map(&:to_i).sort }
  pandigital = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  concated = ''
  i = 1
  until i > 9
    concated << (n * i).to_s
    #break if parse[concated] == pandigital
    break if concated.size >= 9
    i += 1
  end
  parse[concated] == pandigital ? concated.to_i : nil
end

def find(limit)
  (1..limit).map do |candidate|
    mult(candidate)
  end.compact.sort.last
end

Benchmark.bm do |x|
  x.report("9999: ") { p find(9999) }
  x.report("999_999: ") { p find(999_999) }
end

# user     system      total        real
# 9999: 932718654
#  0.100000   0.000000   0.100000 (  0.106411)
# 999_999: 932718654
# 11.370000   0.090000  11.460000 ( 11.608398)
