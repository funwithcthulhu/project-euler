require 'prime'

def pfactor(x)
  (1..x).map do |i|
    i if x % i == 0 && i.prime?
  end
  .compact
  .size > 3
end

def find(limit)
  a = (10_000..limit).select do |y|
    y if pfactor(y) && (pfactor(y - 1) || pfactor(y + 1))
  end
  #(0..a.size - 3).each do |i|
  a.each_index do |i|
    #if i > a.size - 3
    #  return 'No match found'
      #break
    #end
    if (a[i] == a[i + 1] - 1) && (a[i] == a[i + 2] - 2) && (a[i] == a[i + 3] - 3)
      return [a[i], a[i + 1], a[i + 2], a[i + 3]]
    end
  end
end
