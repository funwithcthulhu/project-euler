a = ->(t) { Math.sqrt((t * 2) - 1).floor }
tn = ->(t) { a[t] * (a[t] + 1) / 2 }
is_triangle = ->(t) { tn[t] == t }

b = ->(p) { Math.sqrt((2 * p + 1) / 3).ceil }
pn = ->(p) { b[p] * (3 * b[p] - 1) / 2 }
is_pentagonal = ->(p) { pn[p] == p }

c = ->(h) { Math.sqrt( (h + 1) / 2).ceil }
hn = ->(h) { c[h] * (2 * c[h] - 1) }
is_hexagonal = ->(h) { hn[h] == h }

(40756..Float::INFINITY).each do |x|
  next unless is_triangle[x]
  next unless is_pentagonal[x]
  next unless is_hexagonal[x]
  puts x
  break
end