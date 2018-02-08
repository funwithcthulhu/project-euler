# Project Euler Problem 71 Ordered Fractions

# Consider the fraction, n/d, where n and d are positive integers.
# If n<d and HCF(n,d)=1, it is called a reduced proper fraction.

# If we list the set of reduced proper fractions for d ≤ 8 in
# ascending order of size, we get:

# 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7,
# 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8

# It can be seen that 2/5 is the fraction immediately to the left of 3/7.

# By listing the set of reduced proper fractions for d ≤ 1,000,000 in
# ascending order of size, find the numerator of the fraction immediately
# to the left of 3/7.

# For this problem I started out with a brute force approach. I realized
# this wasn't practical. I reasoned that the unreduced fraction of 3/7 in
# terms of d <= 1 000 000 is d = 7 * (1000000/7) which is (142857 * 7 = 999999)
# and n for 3/7 would be 3 * 142857 which is 428571. Since we are working with
# the largest un-reduced form of 3/7 allowed by d <= 1000000, then the fraction
# to the left (when sorted by ascending value) would be 428571 - 1 / 999999
# which is 428570. The "code" for this is:

puts 1000000/7 * 3 - 1
