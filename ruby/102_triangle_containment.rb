# Project Euler Problem 102: Triangle Containment
# Three distinct points are plotted at random on a Cartesian plane,
# for which -1000 ≤ x, y ≤ 1000, such that a triangle is formed.

# Consider the following two triangles:

# A(-340,495), B(-153,-910), C(835,-947)

# X(-175,41), Y(-421,-714), Z(574,-645)

# It can be verified that triangle ABC contains the origin, whereas triangle XYZ does not.

# Using p102_triangles.txt, a 27K text file containing
# the co-ordinates of one thousand "random" triangles, find the number of triangles for which
# the interior contains the origin.

# NOTE: The first two examples in the file represent the triangles in the example given above.

# For this problem, I find the area of the triangle, then the area of PAB, PAC, and PBC,
# where PAB, etc. is the triangle formed with the point P = origin (0,0), and A = point A,
# B = point B, etc.
# if the area of the triangle == the area of the three smaller triangles added together
# PAB + PBC + PAC, then the point (the origin) lies within the triangle.

class Triangle
  def initialize(x1, y1, x2, y2, x3, y3)
    @x1 = x1
    @y1 = y1
    @x2 = x2
    @y2 = y2
    @x3 = x3
    @y3 = y3
  end

  def area
    ((@x1 * (@y2 - @y3) + @x2 * (@y3 - @y1) + @x3 * (@y1 - @y2)).to_f / 2.0).abs
  end
end

def origin?(x1, y1, x2, y2, x3, y3)
  area = Triangle.new(x1, y1, x2, y2, x3, y3).area
  pab = Triangle.new(x1, y1, x2, y2, 0, 0).area
  pbc = Triangle.new(0, 0, x2, y2, x3, y3).area
  pac = Triangle.new(x1, y1, 0, 0, x3, y3).area
  area == pab + pbc + pac
end

count = 0
File.open("#{ARGV[0]}").each_line do |line|
  c = line.split(',').map(&:to_i)
  count += 1 if origin?(c[0], c[1], c[2], c[3], c[4], c[5])
end
puts count

# $ ruby 102_triangle_containment.rb p102_triangles.txt
# 228