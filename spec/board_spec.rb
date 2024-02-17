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

    it 'validates placements'do 
      expect(@board_1.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@board_1.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
      expect(@board_1.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it 'validates consecutive placements' do 
      expect(@board_1.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      # expect(@board_1.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
      # expect(@board_1.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
      # expect(@board_1.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
    end
  end



end