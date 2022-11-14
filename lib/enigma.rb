class Enigma
  attr_reader :character_set, 
              :key, 
              :offsets

  def initialize
    @character_set = ("a".."z").to_a << " "
    @key = nil
    @offsets = nil
  end

  def key_generator
    @key =
      if @key.nil?
        rand(99999).to_s.rjust(5, "0")
      else
        @key
      end
  end

  def todays_date
    Date.today.strftime("%D").delete("/")
  end

  def key_to_four_pairs
    final_keys = []
    split_keys = key_generator.split("")
    4.times do |i|
      final_keys << (split_keys[i] + split_keys[i + 1]).to_i
    end
    final_keys
  end

  def convert_offset(number)
    ((number.to_i ** 2) % 10000).to_s.chars.map(&:to_i)
  end

  def final_shift
    [key_to_four_pairs, offsets].transpose.map(&:sum)
  end

  def message_to_char_index(message)
    message.downcase.split("").map do |character|
      if !@character_set.include?(character)
        character
      else 
        @character_set.find_index(character)
      end
    end
  end

  def shift_number(number, shift_number)
    (number + shift_number) % 27
  end

  def encrypt(message, keys = '', offsets = '')
    @key = 
      if keys == ''
        key_generator
      else
        keys
      end

      @offsets =
        if offsets == ''
          convert_offset(todays_date)
        else
          convert_offset(offsets)
        end
    message_to_numeric = message_to_char_index(message)
    message_char_shift = []
    message_to_numeric.each.with_index do |number, index|
      if number.class != Integer 
        message_char_shift << number
      else
        message_char_shift << shift_number(number, final_shift[index % 4])
      end
    end
    # require 'pry'; binding.pry

    encrypted_message = message_char_shift.map do |character|
      # require 'pry'; binding.pry
      if character.class != Integer
        character
      else
        @character_set[character].to_s
      end
      # require 'pry'; binding.pry
    end.join
    {
      encryption: encrypted_message,
      key: @key,
      date: offsets
    }
  end

  # def decrypt(message, offsets = '')
  #   @offsets =
  #     if offsets == ''
  #       convert_offset(todays_date)
  #     else
  #       convert_offset(offsets)
  #     end
  #   decrypt_to_numeric = message_to_char_index(message)
  #   message_char_shift = []
  #   message_to_numeric.each.with_index do |number, index|
  #     message_char_shift << shift_number(number, final_shift[index % 4])
  #   end

  #   encrypted_message = message_char_shift.map do |char_index|
  #     @character_set[char_index]
  #   end.join
  #   {
  #     encryption: encrypted_message,
  #     key: @key,
  #     date: offsets
  #   }
  # end
end
