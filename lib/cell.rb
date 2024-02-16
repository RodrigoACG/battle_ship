class Cell
    attr_reader :coordinate, :ship

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fired_upon = false
    end

    def empty?
        @ship == nil
    end

    def place_ship(ship_object)
        @ship = ship_object
    end

    def fired_upon? 
        @fired_upon 
    end

    def fire_upon
        @fired_upon = true 
        @ship.hit unless @ship == nil
    end

    
end