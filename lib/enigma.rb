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
    conversion = ((number.to_i ** 2) % 10000).to_s.chars.map(&:to_i)
  end

  def final_shift
    [key_to_four_pairs, offsets].transpose.map(&:sum)
    
  end

  def message_to_char_index(message)
    message.downcase.bytes.map do |letter_to_ascii_char|
      if letter_to_ascii_char == 32
        letter_to_ascii_char - 6
      elsif (97..122).include?(letter_to_ascii_char)
        letter_to_ascii_char - 97
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
      message_char_shift << shift_number(number, final_shift[index % 4])
    end

    encrypted_message = message_char_shift.map do |char_index|
      @character_set[char_index]
    end.join
    {
      encryption: encrypted_message,
      key: @key,
      date: offsets
    }
  end
end
