module UnionFind
    require 'set'

    class UnionFind
        attr_reader :components

        def initialize
            @components = Set.new
            @rpz = {}
            @size = {}
        end

        def add(comp)
            @components.add(comp)
        end

        def find(comp)
            raise IndexError, "Unexisting comp" unless @components.include? comp

            @rpz[comp] ||= comp
            @size[comp] ||= 1

            until comp == @rpz[comp]
                # path compression
                @rpz[comp] = @rpz[@rpz[comp]]
                # traversal
                comp = @rpz[comp]
            end

            return comp
        end

        def union(comp1, comp2)
            root1 = find(comp1)
            root2 = find(comp2)

            return nil if root1 == root2

            if @size[root1] < @size[root2]
                @size[root2] += @size[root1]
                @rpz[root1] = root2
            else
                @size[root1] += @size[root2]
                @rpz[root2] = root1
            end
        end

    end

end
