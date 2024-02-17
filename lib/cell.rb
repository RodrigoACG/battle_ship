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

    def render(ship_cond = nil) 
        
        if ship_cond == true 
            
            if  @fired_upon == false
                return "S"
            elsif @fired_upon == true && @ship.health == 0 && @ship.sunk? == true
                return "X"
            elsif @fired_upon == true 
                return "H"
            end      
        end
        
        if 
            @fired_upon == true && @ship == nil
            "M"
        else
            "."   
        end
        
    end

end