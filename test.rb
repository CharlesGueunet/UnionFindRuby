require "./UnionFind"

uf = UnionFind::UnionFind.new

uf.add 1
uf.add 2
uf.add 3
uf.add 4
uf.add 5

puts uf.union(2,3)
puts uf.union(1,2)
puts uf.union(4,2)

puts uf.find(1)
puts uf.find(2)
puts uf.find(3)
puts uf.find(4)
puts uf.find(5)

