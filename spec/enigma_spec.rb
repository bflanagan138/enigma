require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end
  it 'exists and has 27 characters' do
    expect(@enigma).to be_a (Enigma)
    # expect(@enigma.character_set.count).to eq (27)
    # expect(@enigma.character_set.first).to eq ("a")
    # expect(@enigma.character_set.last).to eq (" ")
  end

  #add mocks and stubs to test fully
  it 'generates a random five digit number' do
    expect(@enigma.key_generator).to be_a (String)
    expect(@enigma.key_generator.length).to eq (5)
    # expect(@enigma.key_generator).to eq ("01234")
    
  end

  it 'creates an array of 4 key strings from the return value of the key generator' do
    # key_gen_mock = ("12345")
    # allow(key_gen_mock).to receive(:key_generator).and_return("12345")
    expect(@enigma.keys.length).to eq (4)
    expect(@enigma.keys).to be_a (Array)
    # expect(@enigma.keys).to eq ([12, 23, 34, 45])
  end

  it 'returns todays date as a string' do
    expect(@enigma.todays_date).to be_a (String)
    expect(@enigma.todays_date.length).to eq (6)
  end

  it 'creates an array of 4 offset based on the date' do
    expect(@enigma.offsets).to be_a (Array)
    expect(@enigma.offsets.length).to eq (4)
  end

  it 'creates a final shift from keys and offsets' do
    expect(@enigma.final_shift).to be_a (Array)
    expect(@enigma.final_shift.length).to eq (4)
  end

  it 'can encrypt a message' do
    # expect(@enigma.encrypt("hello world", "02715", "040895")).to eq ({encryption: "keder ohulw", key: "02715", date: "040895"})
    expect(@enigma.encrypt("hello! world!", "02715", "040895")).to eq ({encryption: "keder ohulw", key: "02715", date: "040895"})
  end
end 