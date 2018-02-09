# Project Euler Problem 73 Counting Fractions in a Range

# Consider the fraction, n/d, where n and d are positive
# integers. If n<d and HCF(n,d)=1, it is called a reduced
# proper fraction.

# If we list the set of reduced proper fractions for d ≤ 8
# in ascending order of size, we get:

# 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7,
# 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8

# It can be seen that there are 3 fractions between 1/3 and 1/2.

# How many fractions lie between 1/3 and 1/2 in the sorted set
# of reduced proper fractions for d ≤ 12,000?

fx = []
(1..12000).each do |d|
  (1...d).each do |n|
    fx << [n, d]
  end
end

fx.delete_if { |x| x[0].to_f/x[1].to_f <= (1.0/3.0) || x[0].to_f/x[1].to_f >= 0.5}
fx.delete_if { |x| x[0].to_f/x[1].to_f >= 0.5 }

fx.each do |f|
  temp = f[0].gcd(f[1]) 
  if temp != 1
    f[0] /= temp
    f[1] /= temp
  end
end

fx.uniq!.size

#=> 7295372
