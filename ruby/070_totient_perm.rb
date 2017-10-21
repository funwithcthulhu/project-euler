require 'prime'

# Totient function based on Euler's product formula
def totient(n)
  running_tot = n
  divisors = []
  factor_array = Prime.prime_division(n)
  factor_array.each do |array|
    divisors.push(array.first)
  end
  divisors.each do |factor|
    running_tot *= (1.0 - (1.0/factor.to_f))
  end
  running_tot.to_int
end

def totient_perm(limit)
  perm = ->(a, b) { a.to_s.split(//).sort == b.to_s.split(//).sort}  
  possible = []
  (2..limit).each do |cand|
    if perm[totient(cand),cand]
      possible << cand
    end
  end
  possible
end

def totient_min(array)
  min = 10
  n = 0
  array.each do |i|
    if i.to_f / totient(i) <= min
      min = i.to_f / totient(i)
      n = i
    end
  end
  n
end

MAX = 10**7

POSSIBLE = totient_perm(MAX)

totient_min(POSSIBLE)
# => 8319823
