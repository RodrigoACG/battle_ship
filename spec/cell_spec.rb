require 'spec_helper'

RSpec.describe Cell do 
  before(:each)do 
  @cell = Cell.new("B4")
  end

  it 'exists'do 
   expect(@cell).to be_a(Cell)
  end

  describe '#cell attributes' do
    it 'coordinate of a cell' do 
      expect(@cell.coordinate).to eq("B4")
    end

    it 'ship' do 
      expect(@cell.ship).to eq(nil)
    end
  end

end