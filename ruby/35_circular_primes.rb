require 'prime'

def circular?(n)
  s = n.to_s.size
  arr = n.to_s.split(//).map(&:to_i)
  count = 1
  while count <= s
    return false unless arr.join.to_i.prime?
    return false unless arr.rotate(count).join.to_i.prime?
    count+=1
  end
  true
end

def count_circulars(lim)
  (2...lim).select do |number|
    circular?(number)
  end.size
end