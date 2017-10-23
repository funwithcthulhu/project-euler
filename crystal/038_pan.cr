require "benchmark"

def mult(n)
  parse = ->(x : String) { x.split(//).map(&.to_i).sort }
  pandigital = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  concated = ""
  i = 1
  until i > 9
    concated += (n * i).to_s
    break if concated.size >= 9
    i += 1
  end
  parse.call(concated) == pandigital ? concated.to_i : 0
end

Benchmark.bm do |x|
  x.report("9999") do 
    a = (1..9999).map do |candidate|
      mult(candidate)
    end
    a.delete(0)

    puts a.sort.last
  end
  x.report("999_999") do 
    a = (1..999_999).map do |candidate|
      mult(candidate)
    end
    a.delete(0)

    puts a.sort.last
  end
end

# user     system      total        real
# 9999    932718654
#  0.010000   0.000000   0.010000 (  0.018941)
# 999_999 932718654
#  1.220000   0.080000   1.300000 (  1.247134)
