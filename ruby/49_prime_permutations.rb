require 'prime'

def sel_perms(n)
  a = n.to_s.split(//).permutation(4).map(&:join).map(&:to_i).select do |x|
    x.prime?
  end.sort
  a.size > 1 ? a : 0
end

POSSIBLE = (1000..9999).to_a.select(&:prime?)
