# Project Euler 39
# Naive, brute force approach
#
# Solves in about 31 minutes
# EDIT: RELEASE COMPILED SOLVES IN 176 seconds
# TODO: optimizations to get solve time < 1 minute
require "Benchmark"

def right_triangle?(a, b, c)
  a**2 + b**2 == c**2
end

def solutions(val, sides)
  triangles = [] of Array(Int32)
  sides.each do |a|
    sides.each do |b|
      sides.each do |c|
        if (a + b + c == val) && (right_triangle?(a, b, c))
          triangles.push([a, b, c])
        end
      end
    end
  end
  triangles
end

def maximum?(limit)
  side_arr = [] of Int32
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
end

Benchmark.bm do |x|
  x.report("1000: ") { maximum?(1000) }
end


# $ crystal 39_right_triangles.cr
# 840
# [[40, 399, 401],
# [56, 390, 394],
# [105, 360, 375],
# [120, 350, 370],
# [140, 336, 364],
# [168, 315, 357],
# [210, 280, 350],
# [240, 252, 348],
# [252, 240, 348],
# [280, 210, 350],
# [315, 168, 357],
# [336, 140, 364],
# [350, 120, 370],
# [360, 105, 375],
# [390, 56, 394],
# [399, 40, 401]]

# RELEASE COMPILED
# user     system      total        real
# 1000:  840
#  175.290000   0.390000   175.680000 (  176.550674)