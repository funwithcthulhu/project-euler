def slide(input)
  start = Time.now
  pyramid = []

  # creates a nested array from the challenge txt file
  File.open(input).readlines.each do |line|
    pyramid << line
  end
  pyramid.map! { |string| string.split(' ').map!(&:to_i) }

  # sums each item of the pyramid with the higher of the two items
  # below it, then returns the first (final sum) item of the
  # transformed array
  (pyramid.size - 1).downto(0) do |i|
    0.upto(pyramid[i].length - 2) do |j|
      pyramid[i - 1][j] += [pyramid[i][j], pyramid[i][j + 1]].max
    end
  end
  puts Time.now - start
  pyramid.shift.shift
end
