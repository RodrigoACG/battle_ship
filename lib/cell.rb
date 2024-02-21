class Cell
    attr_reader :coordinate, :ship

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fired_upon = false
    end

    def cell_empty?
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
        # require 'pry'; binding.pry
        if ship_cond == true 
            
            if  @fired_upon == false && @ship != nil
                return " S"
            elsif @fired_upon == true && @ship.sunk? == true
                return " X"
            elsif @fired_upon == true && @ship.sunk? == false
                return " H"
            end      
        end
        # require 'pry'; binding.pry
        if 
            @fired_upon == true && @ship == nil
            " M"
        else
            " ."   
        end
        
    end
end