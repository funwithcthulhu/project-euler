# Project Euler Problem 206 - Concealed Square

# Find the unique positive integer whose square
# has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.

start = 138902663  # sqrt of 19293949596979899

# We only need to find 1_2_3_4_5_6_7_8_9,
# and we can multiply it by 10 to add the 2 trailing zeroes
def match(n)
  str = n.to_s
  return false unless str[0] == 1.to_s
  return false unless str[2] == 2.to_s
  return false unless str[4] == 3.to_s
  return false unless str[6] == 4.to_s
  return false unless str[8] == 5.to_s
  return false unless str[10] == 6.to_s
  return false unless str[12] == 7.to_s
  return false unless str[14] == 8.to_s
  return false unless str[16] == 9.to_s
  return true
end

start -= 1 until match(start * start)
puts start * 10

#        user     system      total        real
# 1389019170
# 0.000000   0.000000   0.000000 (  0.001457)
