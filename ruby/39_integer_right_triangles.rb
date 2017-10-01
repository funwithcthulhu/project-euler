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
