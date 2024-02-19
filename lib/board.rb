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
    return false unless cell_array.all? { |name| valid_coordinate?(name) }
    row_coords = cell_array.map { |name| name[0] }
    col_coords = cell_array.map { |name| name[1..-1].to_i }
    
    if row_coords.uniq.length != 1 && col_coords.uniq.length != 1 # Check if the ship placement is neither horizontal nor vertical
      return false
    elsif row_coords.uniq.length == 1 # Horizontal placement
      return true if consecutive_cells?(col_coords) && horizontal_placement_valid?(ship_object, row_coords[0], col_coords.min)
    elsif col_coords.uniq.length == 1 # Vertical placement
      return true if consecutive_cells?(row_coords) && vertical_placement_valid?(ship_object, row_coords.min, col_coords[0])
    end
  end

  def horizontal_placement_valid?(ship_object, start_row, start_col)
    row_index = ('A'..'D').to_a.index(start_row)
    row_check = []
    ship_object.length.times do |num|
      row_check << @cells["#{('A'..'D').to_a[row_index]}#{start_col + num}"]  
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
end

