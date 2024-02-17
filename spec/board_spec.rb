require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board_1 = Board.new
    @grid = @board_1.cells.keys
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
  end

end