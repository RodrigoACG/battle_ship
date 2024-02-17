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

    end
end