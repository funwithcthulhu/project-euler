"""
Project Euler Problem 9
Special Pythagorean triplet

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

------------------------------------------------

naive brute force in Ruby
"""

def product(matrix)
  sums = matrix.map { |x| x.inject(:*) }
  sums.each { |x| puts x }
end

def find_triplet(num)
  array = []
  (1..num).each do |a|
    (1..num).each do |b|
      (1..num).each do |c|
        array.push([a,b,c]) if a + b + c == num
      end
    end
  end
  ans = array.select { |x| x if (x[0]**2 + x[1]**2) == x[2]**2 }
  product(ans)
end
