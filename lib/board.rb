require './lib/cell'

class Board
  attr_reader :cells

  def initialize  
    @cells = {}
    ('A'..'D').each do |row|
        (1..4).each do |col|
            cell_name = "#{row}#{col}"
            @cells[cell_name] = Cell.new(cell_name)
        end
    end   
  end

  def valid_coordinate?(cell_name_check)
    #split the string in cell_name_check in to rows and columns
    #check to make sure rows are valid as well as columns
    split_coord = cell_name_check.chars
    valid_row = ('A'..'D').include?(split_coord[0])
    valid_col = split_coord[1..-1].join.to_i.between?(1, 4)
    valid_row && valid_col
  end

  def valid_placement?(ship_object, cell_array) 
    row_array = []
    col_array = []
    return false unless cell_array.all? { |name| valid_coordinate?(name) }
    row_array << cell_array.map { |name| name[0] }
    col_array << cell_array.map { |name| name[1..-1].to_i }
    col_coords = col_array.flatten.compact
    row_coords = row_array.flatten.compact
    
    #check if inputs are sufficient 
    if row_coords.uniq.length != 1 && col_coords.uniq.length != 1 # Check if the ship placement is neither horizontal nor vertical
      return false
    elsif cells_empty?(cell_array) == false
      return false
    elsif row_coords.uniq.length == 1 # Horizontal placement
      (consecutive_cells?(col_coords) && horizontal_placement_valid?(ship_object, row_coords[0], col_coords.min)) && col_coords.count == ship_object.length
    elsif col_coords.uniq.length == 1 # Vertical placement
      (consecutive_cells?(row_coords) && vertical_placement_valid?(ship_object, row_coords.min, col_coords[0])) && row_coords.count == ship_object.length
    else
      false
    end
    # that cell wont be able to be use anymore 
  end

  def horizontal_placement_valid?(ship_object, start_row, start_col)
    row_index = ('A'..'D').to_a.index(start_row)
    row_check = []
    
    ship_object.length.times do |num|
      if row_index != nil
        row_check << @cells["#{('A'..'D').to_a[row_index]}#{start_col + num}"]  
      else
        false
      end
    end
    
     row_check.compact.count == ship_object.length
  end

  def vertical_placement_valid?(ship_object, start_row, start_col)
    row_index = ('A'..'D').to_a.index(start_row)
    col_check = []
    
    ship_object.length.times do |num|
      if row_index != nil
        col_check << @cells["#{('A'..'D').to_a[row_index + num]}#{start_col}"]
      else
        false
      end
    end
    col_check.compact.count == ship_object.length
  end

  def consecutive_cells?(coords)
    (coords.min..coords.max).to_a == coords
  end

  def place(ship_object, cell_array)
    if valid_placement?(ship_object, cell_array) 
      cell_array.each do |coord|
        @cells["#{coord}"].place_ship(ship_object)
      end
    end
  end
  
  def cells_empty?(coords)
    coords.all? do |coord|
      @cells["#{coord}"].cell_empty?
    end
  end


  def render(ship = nil)
    row_0 = "  1 2 3 4 \n" 
    display_cells = @cells.map do |coordinate, cell|
      cell.render(ship)
    end
      
    row_1 = "A" + display_cells[0..3].join + " \n"
    row_2 = "B" + display_cells[4..7].join + " \n"
    row_3 = "C" + display_cells[8..11].join + " \n"
    row_4 = "D" + display_cells[12..15].join + " \n"
    
    row_0 + row_1 + row_2 + row_3 + row_4  
    
  end

  def fire_at(cell_coord)
    return false unless valid_coordinate?(cell_coord)
    cell = @cells[cell_coord]

    return false unless cell.fired_upon? == false
    cell.fire_upon
  end
  
end