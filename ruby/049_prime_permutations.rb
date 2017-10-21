require 'prime'

def sel_perms(n)
  a = n.to_s.split(//).permutation(4).map(&:join).map(&:to_i).select do |x|
    x.prime? && x.to_s.size == 4
  end.uniq.sort
  a.uniq.size >= 3 ? a : nil
end

def perm?(a, b, c)
  arr = a.to_s.split(//).map(&:to_i).permutation(4).to_a.map do |x|
    x.join.to_i
  end
  arr.include?(b) && arr.include?(c)
end

POSSIBLE = (1000..9999).to_a.select(&:prime?)
NEXT = []
POSSIBLE.each do |candidate|
  NEXT << sel_perms(candidate)
end
NEXT.compact!
NEXT.each do |sub_arr|
  sub_arr.sort!
end
ANSWER = []
NEXT.each do |sub|
  sub.any? do |a|
    sub.any? do |b|
      sub.any? do |c|
        if a != b && b != c && a != c
          if perm?(a, b, c)
            if a - b == b - c
              ANSWER << a.to_s + b.to_s + c.to_s
            end
          end
        end
      end
    end
  end
end
ANSWER.map!(&:to_i).reject! { |x| x == 148748178147 }.uniq!
puts ANSWER
