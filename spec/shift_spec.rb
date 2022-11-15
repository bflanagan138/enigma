require './lib/shift'
require './lib/enigma'

RSpec.describe Shift do
  before(:each) do 
    @shift = Shift.new
  end

  it 'exists' do
    expect(@shift).to be_a Shift
  end

  it 'can shift a number' do
    expect(@shift.shift_number(10, 10)).to eq 20
    expect(@shift.shift_number(34, 2)).to eq 9
  end
end