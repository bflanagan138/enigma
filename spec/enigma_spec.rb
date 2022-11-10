require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_a (Enigma)
  end

  it 'can encrypt a message' do
    enigma = Enigma.new
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq ({encryption: "keder ohulw", key: "02715", date: "040895"})
  end
end