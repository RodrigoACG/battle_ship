require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board_1 = Board.new
    @grid = @board_1.cells.keys
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)  

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
      expect(@board_1.horizontal_placement_valid?(@cruiser, "A", 2)).to eq(true)
      expect(@board_1.horizontal_placement_valid?(@cruiser, "B", 4)).to eq(false)
      require 'pry'; binding.pry
      expect(@board_1.horizontal_placement_valid?(@cruiser, "C", 2)).to eq(true)
    end

    # it 'validates placements horizontally'do 
    #   expect(@board_1.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
    #   expect(@board_1.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
    #   expect(@board_1.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
    # end

    # it 'validates if placement vertically works'do 
    #   expect(@board_1.vertical_placement_valid?(@cruiser, 0, 1)).to eq(false)
    #   expect(@board_1.vertical_placement_valid?(@cruiser, 0, 1)).to eq(true)
    #   expect(@board_1.vertical_placement_valid?(@cruiser, 0, 1)).to eq(false)
    # end

    # it 'validates placements vertically'do 
    #   expect(@board_1.valid_placement?(@cruiser, ["B1", "B2"])).to eq(false)
    #   expect(@board_1.valid_placement?(@cruiser, ["C1", "C2", "C3"])).to eq(true)
    #   expect(@board_1.valid_placement?(@submarine, ["D2", "D3", "D4"])).to eq(false)
    # end

    # it 'validates consecutive placements' do 
    #   expect(@board_1.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
    #   expect(@board_1.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
    #   expect(@board_1.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
    #   expect(@board_1.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
    # end
  end
end