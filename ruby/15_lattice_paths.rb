def find_path(grid_size)
  paths = 1
  grid_size.times do |i|
    paths *= (2 * grid_size) - i
    paths /= i + 1
  end
  paths
end

# irb(main):018:0> findpaths(20)
# => 137846528820