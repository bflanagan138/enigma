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
      # require 'pry'; binding.pry
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
    character_shift = []
    encrypted_message_to_numeric.each.with_index do |character, index|
      if character.class != Integer
        character_shift << character
      else
        character_shift << unshift_number(character, key_to_four_pairs[index % 4])
      end
    end

    decrypted_message = []
    character_shift.each do |character|
      if character.class != Integer
        decrypted_message << character
      else
        decrypted_message << @character_set.fetch(character)
      end
    end
    { decryption: decrypted_message.join.to_s, key: key, date: date }
  end
end
