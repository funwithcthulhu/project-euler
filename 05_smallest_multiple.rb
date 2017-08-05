require 'Prime'

def smallest_multiple(n)
  (2..n).collect { |x| x.prime? }
