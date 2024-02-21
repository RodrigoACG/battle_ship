require 'spec_helper'

RSpec.describe Cell do 
  before(:each)do 
    @cell = Cell.new("B4")
    @cell_2 = Cell.new("C3")
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
      expect(@cell.cell_empty?).to eq(true)
    end
  end

  describe '#place ship' do 
    it 'places a ship' do 
      @cell.place_ship(@cruiser)
      expect(@cell.ship).to eq(@cruiser)
      expect(@cell.cell_empty?).to eq(false)
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

  describe '#render shots' do 
    it 'renders shots' do 
      expect(@cell.render).to eq(" .")
      @cell.fire_upon
      expect(@cell.render).to eq(" M")
    end 
  end
  
  it 'renders its shot'do 
    # need ship object to be verified when being fired upon 
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    expect(@cell.render(true)).to eq(" H")
    @cell.fire_upon
    expect(@cell.render(true)).to eq(" H")
    @cell.fire_upon
    expect(@cell.render(true)).to eq(" X")
  end
  

  it "cell 2 getting sunk" do 
    @cell_2.place_ship(@cruiser)
    expect(@cell_2.render).to eq(" .")
    expect(@cell_2.render(true)).to eq(" S")
    @cell_2.fire_upon
    expect(@cell_2.render(true)).to eq(" H")
    expect(@cruiser.sunk?).to eq(false)
    @cruiser.hit
    @cruiser.hit
    expect(@cruiser.sunk?).to eq(true)
    expect(@cell_2.render(true)).to eq(" X")
  end
end



