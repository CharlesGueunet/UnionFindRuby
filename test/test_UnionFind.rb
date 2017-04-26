require 'minitest/autorun'
require 'union_find'

class UnionFindTest < Minitest::Test
    def test_uf
        uf = UnionFind::UnionFind.new

        assert uf.components.empty?, "initially not empty"

        uf.add 1

        assert_equal 1, uf.components.size, "Element not added"

        uf.add 1,2,3,4,5,6,7

        assert_equal 7, uf.components.size, "Multiple with duplicate wrong"

        uf.union(1,2)

        assert_equal uf.find(1), uf.find(2), "Simple union failed"

        uf.union(3,4,5)

        assert_equal uf.find(3), uf.find(5), "Group union failed"
        assert_equal uf.find(4), uf.find(5), "Group union failed"

        uf.union(2,4)

        assert_equal uf.find(1), uf.find(3), "Transitive union failed"

        uf.union(6,7)
        # test differents components
        assert uf.find(1)!= uf.find(7), "Should not be in same component"
    end
end

