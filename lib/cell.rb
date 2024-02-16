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

    def render(ship = nil)
        if ship == true 
            if  @fired_upon == false
                "S"
            elsif @fired_upon == true  
                "H"
            else @fired_upon == true && @ship.health == 0
                "X"
            end      
        end
        
        if 
            @fired_upon == true && @ship == nil
            "M"
        else @fired_upon == false && @ship == nil
            "."
        end
        
    end

end