class Enigma
  attr_reader :character_set, 
              # :key, 
              :date

  def initialize
    @character_set = ("a".."z").to_a << " "
    # @key = nil
    @date = nil
  end

  def key(key = '') 
    if key == ''
      rand(99999).to_s.rjust(5, "0")
    else
      key
    end
  end

  # def key_generator
  #   @key =
  #     if @key.nil?
  #       rand(99999).to_s.rjust(5, "0")
  #     else
  #       @key
  #     end
  # end

  def todays_date
    Date.today.strftime("%D").delete("/")
  end

  def key_to_four_pairs
    final_keys = []
    split_keys = key.split("")
    4.times do |i|
      final_keys << (split_keys[i] + split_keys[i + 1]).to_i
    end
    final_keys
  end

  def convert_offset(date_string)
    ((date_string.to_i ** 2) % 10000).to_s.chars.map(&:to_i)
  end

  def final_shift
    if date != nil
      [key_to_four_pairs, date].transpose.map(&:sum)
    else 
      [key_to_four_pairs, convert_offset(todays_date)].transpose.map(&:sum)
    end
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
    (number + shift_number) %27
  end

  def unshift_number(number, shift_number)
    (number - shift_number) %27
  end

  def encrypt(message, key = '', date = '')
    # @key = 
    #   if keys == ''
    #     key_generator
    #   else
    #     keys
    #   end

      @date =
        if date == ''
          convert_offset(todays_date)
        else
          convert_offset(date)
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

    encrypted_message = message_char_shift.map do |character|
      if character.class != Integer
        character
      else
        @character_set[character].to_s
      end
    end.join
    {
      encryption: encrypted_message,
      key: @key,
      date: date
    }
  end

  def decrypt(encrypted_message, key = '', date = '')
    @key = 
      if keys == ''
        key_generator
      else
        keys
      end
      @date =
        if date == ''
          convert_offset(todays_date)
        else
          convert_offset(date)
        end

        encrypted_message_to_numeric = message_to_char_index(encrypted_message)
        character_shift = []
        encrypted_message_to_numeric.each.with_index do |character, index|
          if character.class != Integer
            character_shift << character
          else
            character_shift << unshift_number(character, final_shift[index % 4])
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
    {
      decryption: decrypted_message.join.to_s,
      key: @key,
      date: date
    }
  end
end
