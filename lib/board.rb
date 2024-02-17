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
        split_coord = cell_name_check.chars
        valid_row = ('A'..'D').include?(split_coord[0])
        valid_col = split_coord[1..-1].join.to_i.between?(1, 4)
        valid_row && valid_col
        #split the string in cell_name_check in to rows and columns
        #check to make sure rows are valid as well as columns
    end
end