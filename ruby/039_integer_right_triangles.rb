# Project Euler 39 - Integer right triangles
# If p is the perimeter of a right angle triangle with integral length
# sides, {a,b,c}, there are exactly three solutions for p = 120.

# {20,48,52}, {24,45,51}, {30,40,50}

# For which value of p ≤ 1000, is the number of solutions maximised?

# EDIT: November 4, 2017
# Came back to this problem today and rewrote it. Solution in Ruby now takes
# about 35 ms. Nice to see some improvement in my code-writing skills!
# Find new code below, and old solution at bottom of the page.

require 'benchmark'

Cache = Hash.new(0)

def search(limit)
  right_triangle = ->(a, b, c) { a**2 + b**2 == c**2 }
  (1..limit).each do |a|
    ((a + 1)..limit).each do |b|
      c = Math.sqrt(a**2 + b**2).floor
      break if (a + b + c) > limit
      if right_triangle[a, b, c]
        Cache[a+b+c] += 1
      end
    end
  end
end

Benchmark.bm do |x|
  x.report do 
    search(1000)
    p Cache.key(Cache.values.max)
  end
end

# user     system      total        real
# 840
# 0.030000   0.000000   0.030000 (  0.030711)

# Old (aka shitty) solution below (from September 30)
#
# Same code ported to Crystal solves in 176 seconds
#
# I ended the program before a solution was generated
#
# In Ruby the program was taking longer than 31 minutes..

def right_triangle?(a, b, c)
  a**2 + b**2 == c**2
end

def solutions(val, sides)
  triangles = []
  sides.each do |a|
    sides.each do |b|
      sides.each do |c|
        if (a + b + c == val) && (right_triangle?(a, b, c))
          triangles << [a, b, c]
        end
      end
    end
  end
  triangles
end

def maximum?(limit)
  side_arr = []
  max_p = 0
  size = 0
  (1..limit).each do |p|
    sides = (1..p).to_a
    if solutions(p, sides).size >= size
      max_p = p
      size = solutions(p, sides).size
      side_arr = solutions(p, sides)
    end
  end
  p max_p
  p side_arr
end

# Crystal benchmarks
# user     system      total        real
# 1000:  840
#  175.290000   0.390000   175.680000 (  176.550674)
