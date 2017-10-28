require 'prime'
require 'benchmark'

Benchmark.bm do |x|
  x.report do 
    cache = {}
    count = 0

    bees = (1..1_000).select { |x| x.prime? }
    aas = []
    (1..1_000).each { |x| aas.unshift(-x) }
    (1..1_000).each { |x| aas.push(x) }

    aas.each do |a|
      bees.each do |b|
        (0..500).each do |n|
          candidate = n**2 + (a * n) + b
          if candidate.prime?
            count += 1
          else
            cache[count] = [a, b]
            count = 0
            break
          end
        end
      end
    end

    puts cache[cache.keys.max].inject(:*)
  end
end

# user     system      total        real
# -59231
# 0.500000   0.000000   0.500000 (  0.504473)
