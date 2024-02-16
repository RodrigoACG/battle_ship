require 'spec_helper'

RSpec.describe Ship do
  before(:each)do
  @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists' do 
    expect(@cruiser).to be_a(Ship)
  end

  describe'#cruiser' do 
    it 'describes a cruiser at default' do 
      expect(@cruiser.name).to eq("Cruiser")
      expect(@cruiser.length).to eq(3)
      expect(@cruiser.health).to eq(3)
      expect(@cruiser.sunk?).to eq(false)
    end
    
    it 'describe cruiser getting attacked' do 
      @cruiser.hit
      expect(@cruiser.health).to eq(2) 
      @cruiser.hit
      expect(@cruiser.health).to eq(1) 
      expect(@cruiser.sunk?).to eq(false)
      @cruiser.hit
      expect(@cruiser.health).to eq(0) 
      expect(@cruiser.sunk?).to eq(true)

    end
  end
end
