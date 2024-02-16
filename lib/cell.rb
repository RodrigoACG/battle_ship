class Cell
    attr_reader :coordinate

    def initialize(cell_name)
        @coordinate = cell_name
        @ship = nil
    end

    def empty?
        @ship == nil
    end

    def 
end