require 'prime'
require 'benchmark'

def right_trunc?(prime)
  switch = true
  until prime.to_s.size == 1
    switch = false unless prime.prime?
    prime = prime.to_s.split(//)
    prime.pop
    prime = prime.join.to_i
  end
  switch = false unless prime.prime?
  switch
end

def left_trunc?(prime)
  switch = true
  until prime.to_s.size == 1
    switch = false unless prime.prime?
    prime = prime.to_s.split(//)
    prime.shift
    prime = prime.join.to_i
  end
  switch = false unless prime.prime?
  switch
end

def truncatable?(prime)
  return false if prime < 8
  return false unless right_trunc?(prime)
  return false unless left_trunc?(prime)
  true
end

def find
  truncs = []
  Prime.each do |candidate|
    truncs << candidate if truncatable?(candidate)
    break if truncs.size == 11
  end
  truncs.sum
end

Benchmark.bm do |x|
  x.report('sum: ') { puts find }
end

# user     system      total        real
# sum: 748317
#  1.630000   0.010000   1.640000 (  1.646900)

# Using (10..Float::INFINITY).each finds the answer in 18 seconds
