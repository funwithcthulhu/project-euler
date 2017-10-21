# Intersting note: using lambdas here for the size expression increases the speed of this
# algorithm by almost 2x
#
# Also interestingly, removing the sz lambda altogether still returns the answer, but the sz
# lambda increases the speed of the algorithm by about 2x

def perms
  (1..Float::INFINITY).each do |x|
    parse =->(n) { (x * n).to_s.split(//).sort }
    sz =->(n) { (x * n).to_s.size }
    cmp =->(a, b, l) { l[a] == l[b]}
    next unless cmp[2, 3, sz]
    next unless cmp[4, 5, sz]
    next unless cmp[1, 6, sz]
    next unless cmp[1, 2, parse]
    next unless cmp[2, 3, parse]
    next unless cmp[3, 4, parse]
    next unless cmp[4, 5, parse]
    next unless cmp[5, 6, parse]
    puts x
    break
  end
end

perms 

# using cmp lambda taking other lambdas as arguments

# user     system      total        real
# 142857
# 0.910000   0.000000   0.910000 (  0.913480)

# using lambdas, and cmp lambda w.o taking lambdas as arguments

# user     system      total        real
# 142857
# 0.830000   0.000000   0.830000 (  0.835862)
