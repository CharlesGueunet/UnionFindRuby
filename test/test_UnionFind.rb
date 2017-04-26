require 'minitest/autorun'
require 'union_find'

class UnionFindTest < Minitest::Test
    def test_uf
        uf = UnionFind::UnionFind.new

        assert uf.components.empty?(), "initially not empty"

        uf.add 1

        assert_equal 1, uf.components.size(), "Element not added"

        uf.add 2
        uf.add 3
        uf.add 4
        uf.add 5
        uf.add 6

        # 1 2 3 4 in one component
        uf.union(2,3)
        uf.union(1,2)
        uf.union(4,2)

        # 5 and 6 in another one
        uf.union(5,6)

        assert_equal uf.find(2), uf.find(3), "Simple union failed"
        assert_equal uf.find(5), uf.find(6), "Simple union failed"

        assert_equal uf.find(1), uf.find(3), "Transitive union failed"
        assert_equal uf.find(4), uf.find(3), "Transitive union failed"

        # test differents components
        assert uf.find(1)!= uf.find(5), "Should not be in same component"
    end
end

