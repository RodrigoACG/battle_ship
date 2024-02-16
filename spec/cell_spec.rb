require 'spec_helper'

RSpec.describe Cell do 
  before(:each)do 
  @cell = Cell.new("B4")
  end

  it 'should be an instance of a cell' do 
    expect(@cell.coordinate).to eq("B4")
  end
end