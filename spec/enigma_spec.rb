require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end
  it 'exists and has 27 characters' do
    expect(@enigma).to be_a (Enigma)
    expect(@enigma.alphabet.count).to eq (27)
    expect(@enigma.first).to eq ("a")
    expect(@enigma.last).to eq (" ")
  end

  it 'generates a random five digit number' do
    key_gen_mock = ("01234")
    allow(key_gen_mock).to receive(:key_generator).and_return("01234")
    expect(@enigma.key_generator).to be_a (String)
    expect(@enigma.key_generator.length).to eq (5)
  end

  it 'returns todays date as a string' do
    expect(@enigma.todays_date).to be_a (String)
    expect(@enigma.todays_date.length).to eq (6)
  end

  it 'returns '

  xit 'can encrypt a message' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq ({encryption: "keder ohulw", key: "02715", date: "040895"})
  end
end 