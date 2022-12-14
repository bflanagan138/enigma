require 'date'
require './lib/enigma'
require './lib/shift'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end
  
  it 'exists' do
    expect(@enigma).to be_a (Enigma)
    expect(@enigma.character_set.count).to eq (27)
    expect(@enigma.character_set.first).to eq ("a")
    expect(@enigma.character_set.last).to eq (" ")
  end

  it 'creates an array of 4 key strings from the key' do
    expect(@enigma.key_to_four_pairs.length).to eq (4)
    expect(@enigma.key_to_four_pairs).to be_a (Array)
    four_keys = []
    four_keys << @enigma.key[0..1].to_i + @enigma.convert_offset[0]
    four_keys << @enigma.key[1..2].to_i + @enigma.convert_offset[1]
    four_keys << @enigma.key[2..3].to_i + @enigma.convert_offset[2]
    four_keys << @enigma.key[3..4].to_i + @enigma.convert_offset[3]
    expect(@enigma.key_to_four_pairs).to eq four_keys
    expect(@enigma.key_to_four_pairs).to be_a Array
  end

  it 'can convert message to index numbers in alphabet' do
    expect(@enigma.message_to_char_index('a')).to eq [0]
    expect(@enigma.message_to_char_index(' ')).to eq [26]
    expect(@enigma.message_to_char_index('a ')).to eq [0, 26]
    expect(@enigma.message_to_char_index('AB')).to eq [0, 1]
    expect(@enigma.message_to_char_index('!?89')).to eq ['!', '?', '8', '9']
  end

  it 'can encrypt a message' do
    expect(@enigma.encrypt('hello world')).to be_a Hash
    expect(@enigma.encrypt('hello world', '02715', '040895')).to eq ({
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    })
    expect(@enigma.encrypt('hello! world?', '02715', '040895')).to eq ({
      encryption: 'keder!sprrdx?',
      key: '02715',
      date: '040895'
    })
  end

  it 'can decrypt a message' do
    expect(@enigma.decrypt('keder ohulw', '02715', '040895')).to eq ({
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    })
    expect(@enigma.decrypt('keder!sprrdx?', '02715', '040895')).to eq ({
      decryption: 'hello! world?',
      key: '02715',
      date: '040895'
    })
  end
end
