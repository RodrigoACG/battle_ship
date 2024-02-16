require 'spec_helper'

RSpec.describe Cell do 
  before(:each)do 
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
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
      expect(@cell.empty?).to eq(true)
    end
  end

  describe '#place ship' do 
    it 'places a ship' do 
      @cell.place_ship(@cruiser)
      expect(@cell.ship).to eq(@cruiser)
      expect(@cell.empty?).to eq(false)
    end
  end

  describe '#fire upon' do 
    it 'fires upon ship' do 
      @cell.place_ship(@cruiser)
      expect(@cell.fired_upon?).to eq(false)
      @cell.fire_upon
      expect(@cell.ship.health).to eq(2)
      expect(@cell.fired_upon?).to eq(true)
    end
  end

end