require './lib/shift'
require './lib/enigma'
require 'date'

RSpec.describe Shift do
  let(:enigma) {Enigma.new}
  
  it 'exists and has a character set' do
    expect(enigma.character_set.count).to eq (27)
    expect(enigma.character_set.first).to eq ("a")
    expect(enigma.character_set.last).to eq (" ")
  end

  it 'creates an array of 4 key strings from the key' do
    expect(enigma.key_to_four_pairs.length).to eq (4)
    expect(enigma.key_to_four_pairs).to be_a (Array)
    four_keys = []
    four_keys << enigma.key[0..1].to_i
    four_keys << enigma.key[1..2].to_i
    four_keys << enigma.key[2..3].to_i
    four_keys << enigma.key[3..4].to_i
    expect(enigma.key_to_four_pairs).to eq four_keys
    expect(enigma.key_to_four_pairs).to be_a Array
  end

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

  it 'creates a final shift from keys and offsets' do
    expect(enigma.final_shift).to be_a (Array)
    expect(enigma.final_shift.length).to eq (4)
  end
end