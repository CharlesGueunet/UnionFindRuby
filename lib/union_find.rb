module UnionFind
    require 'set'

    class UnionFind
        attr_reader :components

        # Create an empty union find
        def initialize
            @components = Set.new
            @rpz = {}
            @size = {}
        end

        # add  elements given in the union find
        def add(*elmts)
            elmts.each do |elmt|
                @components.add(elmt)
            end
        end

        # find the representant of an element
        def find(elmt)
            raise IndexError, "Unexisting element" unless @components.include? elmt

            @rpz[elmt]  ||= elmt
            @size[elmt] ||= 1

            until elmt == @rpz[elmt]
                # path compression
                @rpz[elmt] = @rpz[@rpz[elmt]]
                # traversal
                elmt = @rpz[elmt]
            end

            return elmt
        end

        # join elements of the union find
        def union(*elmts)
            return if elmts.size() < 2
            rootFirst = find(elmts[0])

            elmts.drop(1).each do |elmt|
                rootTmp = find(elmt)

                next if rootFirst == rootTmp

                if @size[rootFirst] < @size[rootTmp]
                    @size[rootTmp] += @size[rootFirst]
                    @rpz[rootFirst] = rootTmp
                else
                    @size[rootFirst] += @size[rootTmp]
                    @rpz[rootTmp] = rootFirst
                end
            end
        end
    end
end
