require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board_1 = Board.new
    @grid = @board_1.cells.keys
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2) 
    @cell_1 = @board_1.cells["A1"]
    @cell_2 = @board_1.cells["A2"]
    @cell_3 = @board_1.cells["A3"]

  end

  describe '#initialize' do
    it 'exists' do
      expect(@board_1).to be_instance_of Board
    end

    it 'has grid of cells' do
        expect(@board_1.cells.keys).to eq(@grid)
    end
  end

  describe '#validating' do
    it 'validates cells' do
      expect(@board_1.valid_coordinate?("A1")).to be true
      expect(@board_1.valid_coordinate?("A22")).to be false
      expect(@board_1.valid_coordinate?("E1")).to be false
      expect(@board_1.valid_coordinate?("D4")).to be true
      expect(@board_1.valid_coordinate?("A5")).to be false
    end

    it 'validates if placement horizontally works'do 
      expect(@board_1.horizontal_placement_valid?(@cruiser, "A", 2)).to be true
      expect(@board_1.horizontal_placement_valid?(@cruiser, "B", 4)).to be false
      expect(@board_1.horizontal_placement_valid?(@cruiser, "C", 2)).to eq true
      expect(@board_1.horizontal_placement_valid?(@cruiser, "D", 1)).to eq true
    end

    it 'validates placements horizontally'do 
      expect(@board_1.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@board_1.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
      expect(@board_1.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it 'validates if placement vertically works'do 
      expect(@board_1.vertical_placement_valid?(@cruiser, 'A', 1)).to be true
      expect(@board_1.vertical_placement_valid?(@cruiser, 'B', 4)).to be true
      expect(@board_1.vertical_placement_valid?(@cruiser, 'F', 1)).to be false    
      expect(@board_1.vertical_placement_valid?(@cruiser, 'C', 4)).to be false    
      expect(@board_1.vertical_placement_valid?(@cruiser, 'X', 4)).to be false    
    end

    it 'validates placements vertically'do 
      expect(@board_1.valid_placement?(@cruiser, ["B1", "B2"])).to eq(false)
      expect(@board_1.valid_placement?(@cruiser, ["C1", "C2", "C3"])).to eq(true)
      expect(@board_1.valid_placement?(@submarine, ["D2", "D3", "D4"])).to eq(false)
    end

    it 'validates consecutive placements' do 
      expect(@board_1.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board_1.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
      expect(@board_1.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(@board_1.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
    end

    it 'validates that diagonal does not work' do 
      expect(@board_1.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(@board_1.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
      expect(@board_1.valid_placement?(@submarine, ["B1", "C2"])).to eq(false)
      expect(@board_1.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
      expect(@board_1.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
    end 
  end

  describe '#placing ships' do
    it 'cells can contain ships' do
      @board_1.place(@cruiser, ["A1", "A2", "A3"])
      @cell_1.ship
      @cell_2.ship
      @cell_3.ship 
      # require 'pry'; binding.pry
      expect(@cell_3.ship).to eq(@cell_2.ship)
    end

    # it 'checks for overlapping ships' do 
    #   @board_1.place(@cruiser, ["A1", "A2", "A3"])
    #   expect(@board_1.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
    # end
  end

  # it 'unit test'do 
  # expect(@board_1.cells_empty?(["A1", "B2", "C3"])).to eq(true)
  # @board_1.cells["A1"].place_ship(@cruiser)
  # expect(@board_1.cells_empty?(["A1", "B2", "C3"])).to eq(false)
  # @board_1.cells["A2"].place_ship(@cruiser)
  # expect(@board_1.cells_empty?(["A1", "B2", "C3"])).to eq(false)
  # end


  describe '#overlapping ships' do
    it 'checks if there is a ship in that cell already' do
      @board_1.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board_1.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
      expect(@board_1.valid_placement?(@submarine, ["C1", "D1"])).to eq(true)
    end
  end

  describe '#render ships to board' do
    it 'renders ' do 
      @board_1.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board_1.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
      # require 'pry'; binding.pry
      expect(@board_1.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
      
    end

    it 'fires upon cell'do 
      @board_1.place(@cruiser, ["A1", "A2", "A3"])
      @cell_1.fire_upon
      
      expect(@board_1.render).to eq("  1 2 3 4 \nA H . . . \nB . . . . \nC . . . . \nD . . . . \n" )
    end
  end
end