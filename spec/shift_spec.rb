require './lib/shift'
require './lib/enigma'

RSpec.describe Shift do
  before(:each) do 
    @shift = Shift.new
  end

  it 'exists' do
    expect(@shift).to be_a Shift
  end

  it 'can shift a number for encryption based on 27 character set' do
    expect(@shift.shift_number(10, 10)).to eq 20
    expect(@shift.shift_number(34, 2)).to eq 9
  end

  it 'can unshift numbers for decryption based on 27 character set' do
    expect(@shift.unshift_number(10, 10)).to eq 0
    expect(@shift.unshift_number(34, 2)).to eq 5
  end

  it 'creates a final shift from keys and offsets' do
    expect(@enigma.final_shift).to be_a (Array)
    expect(@enigma.final_shift.length).to eq (4)
  end
end