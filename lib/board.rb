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
      # require 'pry'; binding.pry
      @cells["#{coord}"].cell_empty?
    end
  end


  # def valid_placement_2?(ship, coords)
  #   consecutive_cells?(coords) &&
  #   coord_length?(ship, coords) &&
  #   cells_empty?(coords)
  # end
  
  # def place(ship_object, cell_array)
  #   if valid_placement_2?(ship_object, cell_array) 
  #     cell_array.each do |coord|
  #       @cells["#{coord}"].place_ship(ship_object)
  #     end
      
  #   end
  #   # to place a ship we need to put a peice of a ship on each cell 
  #   # all the length of the ship should cover a cell. ex cruiser has 3 so 3 cells need to be filled 
  #   # 
  # end
  
  # def consecutive_cells?(coords)
  #   (coords.min..coords.max).to_a == coords
  # end
  # # def consecutive_cells?(cells)
  # #   cells.each_cons(2) 

  # # end

  # def coord_length?(ship, coordinates)
  #   ship.length == coordinates.length
  # end


  # def 


  
end