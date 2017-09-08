# trying to determine why the same code is so much faster in js vs. ruby
# implementation of while loop instead of loop...do....... 
# while loop is faster but still not as fast as the same code in js....

require 'benchmark'

def smallest_multiple(n)
  start = n
  num = start
  while num > 0
    if n % num == 0
      num -= 1
    else
      num = start
    end
    n += 1
  end
  puts n
end


Benchmark.bm do |x|
  x.report('10: ') { smallest_multiple(10) }
  x.report('12: ') { smallest_multiple(12) }
  x.report('16: ') { smallest_multiple(16) }
  x.report('20: ') { smallest_multiple(20) }
  x.report('20: ') { smallest_multiple(20) }
end
