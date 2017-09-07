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
