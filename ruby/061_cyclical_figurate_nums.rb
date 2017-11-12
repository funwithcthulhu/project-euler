a = ->(t) { Math.sqrt((t * 2) - 1).floor }
tn = ->(t) { a[t] * (a[t] + 1) / 2 }
is_triangle = ->(t) { tn[t] == t }

b = ->(p) { Math.sqrt((2 * p + 1) / 3).ceil }
pn = ->(p) { b[p] * (3 * b[p] - 1) / 2 }
is_pentagonal = ->(p) { pn[p] == p }

c = ->(h) { Math.sqrt( (h + 1) / 2).ceil }
hn = ->(h) { c[h] * (2 * c[h] - 1) }
is_hexagonal = ->(h) { hn[h] == h }

sq = ->(n) { Math.sqrt(n).floor**2 == n }

d = ->(o) { Math.sqrt((2 * o + 3) / 5).ceil }
on = ->(o) { d[o] * (5 * d[o] - 3) / 2 }
is_heptagonal = ->(o) { on[o] == o }

e = ->(h) { Math.sqrt( (h + 2) / 3).ceil }
gn = ->(h) { e[h] * (3 * e[h] - 2) }
is_octagonal = ->(h) { gn[h] == h }

hexes = (1000..9999).select { |x| is_hexagonal[x] }
triangles = (1000..9999).select { |x| is_triangle[x] }
pentagons = (1000..9999).select { |x| is_pentagonal[x] }
squares = (1000..9999).select { |x| sq[x] }
heptagons = (1000..9999).select { |x| is_heptagonal[x] }
octagons = (1000..9999).select { |x| is_octagonal[x] }

master = [hexes, triangles, pentagons, squares, heptagons, octagons].flatten.sort.delete_if { |x| x.to_s[2] == '0' }

f_all = ->(dig) { master.find_all { |x| (x.to_s.split(//).shift(2).join.to_i) == dig }}
cache = Hash.new([])
master.each do |first|
  digits = first % 100
  temp = f_all[digits]
  ftemp_hash = {}
  temp.each do |second|
    stemp_hash = {}
    sdigits = second % 100
    stemp = f_all[sdigits]
    stemp.each do |third|
      ttemp_hash = {}
      tdigits = third % 100
      ttemp = f_all[tdigits]
      ttemp.each do |fourth|
        otemp_hash = {}
        fdigits = fourth % 100
        otemp = f_all[fdigits]
        otemp.each do |fifth|
          ltemp_hash = {}
          ldigits = fifth % 100
          ltemp = f_all[ldigits]
          ltemp.each do |sixth|
            ltemp_hash = f_all[ldigits]
          end
          otemp_hash[fifth] = ltemp_hash
        end
        ttemp_hash[fourth] = otemp_hash
      end
      stemp_hash[third] = ttemp_hash
    end
    ftemp_hash[second] = stemp_hash
  end
  cache[first] = ftemp_hash
end

cycles = []

cache.each_pair do |key1, value1|
  first = key1.to_s.split(//).shift(2).join.to_i
  value1.each_pair do |key2, value2|
    value2.each_pair do |key3, value3|
      value3.each_pair do |key4, value4|
        value4.each_pair do |key5, value5|
          value5.each do |candidate|
            if candidate % 100 == first
              cycles << [key1, key2, key3, key4, key5, candidate]
            end
          end
        end
      end
    end
  end
end


def verify_answer(array)
  a = ->(t) { Math.sqrt((t * 2) - 1).floor }
  tn = ->(t) { a[t] * (a[t] + 1) / 2 }
  is_triangle = ->(t) { tn[t] == t }

  b = ->(p) { Math.sqrt((2 * p + 1) / 3).ceil }
  pn = ->(p) { b[p] * (3 * b[p] - 1) / 2 }
  is_pentagonal = ->(p) { pn[p] == p }

  c = ->(h) { Math.sqrt( (h + 1) / 2).ceil }
  hn = ->(h) { c[h] * (2 * c[h] - 1) }
  is_hexagonal = ->(h) { hn[h] == h }

  sq = ->(n) { Math.sqrt(n).floor**2 == n }

  d = ->(o) { Math.sqrt((2 * o + 3) / 5).ceil }
  on = ->(o) { d[o] * (5 * d[o] - 3) / 2 }
  is_heptagonal = ->(o) { on[o] == o }

  e = ->(h) { Math.sqrt( (h + 2) / 3).ceil }
  gn = ->(h) { e[h] * (3 * e[h] - 2) }
  is_octagonal = ->(h) { gn[h] == h }

  duplicate = array.dup
  duplicate.any? do |t|
    is_hexagonal[t]
    if is_hexagonal[t]
      duplicate.delete(t)
    end
  end
  duplicate.any? do |t|
    is_pentagonal[t]
    if is_pentagonal[t]
      duplicate.delete(t)
    end
  end
  duplicate.any? do |t|
    is_triangle[t]
    if is_triangle[t]
      duplicate.delete(t)
    end
  end
  duplicate.any? do |t|
    is_heptagonal[t]
    if is_heptagonal[t]
      duplicate.delete(t)
    end
  end
  duplicate.any? do |t|
    sq[t]
    if sq[t]
      duplicate.delete(t)
    end
  end
  duplicate.any? do |t|
    is_octagonal[t]
    if is_octagonal[t]
      duplicate.delete(t)
    end
  end
  return true if duplicate.empty?
  false
end

ans = cycles.select { |x| verify_answer(x) }.each { |x| x.sort! }.uniq.delete_if do |x|
  x.size != 6
end.flatten.sum

puts ans
