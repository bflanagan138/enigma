require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end
  it 'exists' do
    expect(@enigma).to be_a (Enigma)
  end

  it 'generates a random five digit number' do
    expect(@enigma.key_generator).to be_a (String)
    expect(@enigma.key_generator.length).to eq (5)
  end

  xit 'can encrypt a message' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq ({encryption: "keder ohulw", key: "02715", date: "040895"})
  end

  
end 