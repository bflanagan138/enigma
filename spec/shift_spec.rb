require './lib/shift'
require './lib/enigma'
require 'date'

RSpec.describe Shift do
  let(:enigma) {Enigma.new}
  
  it 'creates an array of 4 offsets based on the date' do
    expect(enigma.convert_offset).to be_a (Array)
    expect(enigma.convert_offset.length).to eq (4)
  end

  it 'can shift a number for encryption based on 27 character set' do
    expect(enigma.shift_number(10, 10)).to eq 20
    expect(enigma.shift_number(34, 2)).to eq 9
  end

  it 'can unshift numbers for decryption based on 27 character set' do
    expect(enigma.unshift_number(10, 10)).to eq 0
    expect(enigma.unshift_number(34, 2)).to eq 5
  end
end