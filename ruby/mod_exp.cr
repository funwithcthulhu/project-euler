
def mod_exp(b, exp, mod)
  prod = 1
  base = b % mod
  until exp.zero?
    prod = (prod * base) % mod if exp.odd?
    exp >>= 1
    base = (base * base) % mod
  end
  prod
end


puts mod_exp(12_i64, 12_i64, 10_i64)
