require './lib/shift'
require './lib/enigma'
require 'date'

RSpec.describe Shift do
  before(:each) do
    @shift = Shift.new(rand(99999).to_s.rjust(5, "0"), Date.today.strftime("%D").delete("/"))
  end
  
  it 'exists and has a character set' do
    expect(@shift.character_set.count).to eq (27)
    expect(@shift.character_set.first).to eq ("a")
    expect(@shift.character_set.last).to eq (" ")
  end

  it 'creates an array of 4 key strings from the key' do
    expect(@shift.key_to_four_pairs.length).to eq (4)
    expect(@shift.key_to_four_pairs).to be_a (Array)
    four_keys = []
    four_keys << @shift.key[0..1].to_i
    four_keys << @shift.key[1..2].to_i
    four_keys << @shift.key[2..3].to_i
    four_keys << @shift.key[3..4].to_i
    expect(@shift.key_to_four_pairs).to eq four_keys
    expect(@shift.key_to_four_pairs).to be_a Array
  end

  it 'creates an array of 4 offsets based on the date' do
    expect(@shift.convert_offset).to be_a (Array)
    expect(@shift.convert_offset.length).to eq (4)
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
    expect(@shift.final_shift).to be_a (Array)
    expect(@shift.final_shift.length).to eq (4)
  end
end