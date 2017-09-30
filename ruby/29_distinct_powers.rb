
def powers(start, a, b)
  arr = []
  n = start
  while n <= b
    arr << a**n
    n += 1
  end
  arr
end

def distinct(a, b)
  arr = []
  start = a
  n = a
  while n <= b
    arr << powers(start, n, b)
    n += 1
  end
  arr.flatten.sort.uniq.size
end
