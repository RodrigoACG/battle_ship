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


end