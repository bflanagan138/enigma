require './shift'

class Enigma
include Shift
attr_reader :character_set,
            :key,
            :date
  def initialize
    @character_set = ("a".."z").to_a << " "
    @key = rand(99999).to_s.rjust(5, "0")
    @date = Date.today.strftime("%d%m%y").delete("/")
  end

  def message_to_char_index(message)
    message.downcase.split("").map do |character|
      if !character_set.include?(character)
        character
      else 
        character_set.find_index(character)
      end
    end
  end

  def encrypt(message, key_input = @key, date_input = @date)
    @key = key_input
    @date = date_input
    message_to_numeric = message_to_char_index(message)
    encrypted_message = message_to_numeric.map.with_index do |number, index|
      if number.class != Integer 
        number
      else
        @character_set[shift_number(number, key_to_four_pairs[index % 4])].to_s
      end
    end.join
    { encryption: encrypted_message, key: key, date: date }
  end

  def decrypt(encrypted_message, key, date)
    encrypted_message_to_numeric = message_to_char_index(encrypted_message)
    require 'pry'; binding.pry
    encrypted_message_to_numeric.map.with_index do |character, index|
      if character.class != Integer
        character
      else
        unshift_number(character, key_to_four_pairs[index % 4])
        require 'pry'; binding.pry
      end
    end
    require 'pry'; binding.pry

    encrypted_message_to_numeric.map.with_index do |character, index|
      # require 'pry'; binding.pry
      if character.class != Integer
        character
      else
        @character_set.fetch(character)
      end
    end
    { decryption: encrypted_message_to_numeric.join.to_s, key: key, date: date }
  end
end
