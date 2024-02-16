require 'spec_helper'

RSpec.describe Ship do
  before(:each)do
  @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists' do 
    expect(@cruiser).to be_a(Ship)
  end

  describe'#cruiser' do 
    it 'describes a cruiser' do 
      expect(@cruiser.name).to eq("Cruiser")
      expect
    end
  end
end
