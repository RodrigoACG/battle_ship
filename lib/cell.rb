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

  def render(player_ship = nil) 
    if player_ship == true && @fired_upon == false && @ship != nil
      " S"   
    elsif  @fired_upon == true && @ship == nil
      " M"
    elsif @fired_upon == true && @ship.sunk? == true
      " X"
    elsif @fired_upon == true && @ship.sunk? == false
      " H"
    else
      " ."   
    end
  end
end