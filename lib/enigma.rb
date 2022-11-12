class Enigma
  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  #helper method for encrypt
  def key_generator
    rand(99999).to_s.rjust(5, "0")
  end
  
  #helper method for encrypt
  def todays_date
    Date.today.strftime("%D").delete("/")
  end
  
  #helper method for shift. Refactor with .rotate and 4.times do?
  def keys
    final_keys = []
    split_keys = key_generator.split("")
    final_keys << (split_keys[0] + split_keys[1]).to_i
    final_keys << (split_keys[1] + split_keys[2]).to_i
    final_keys << (split_keys[2] + split_keys[3]).to_i
    final_keys << (split_keys[3] + split_keys[4]).to_i
    final_keys
  end

  def offsets
    ((todays_date.to_i * todays_date.to_i)%10000).to_s.chars.map(&:to_i)
  end

  def final_shift
    [keys, offsets].transpose.map { |number| number.sum}
  end

  def encrypt(message, key = key_generator, date = offsets)
    numeric = []
    x = message.bytes.each do |letter|
      if letter == 32
        numeric << letter - 5
      elsif (97..122).include?(letter)
        numeric << letter - 96
      # else
        # extension to deal with special characters
        # numeric << letter.bytes.reverse
        # numeric << letter
      end
    end
    # require 'pry'; binding.pry
    conversion = []
    numeric.each do |number|
      if (numeric.find_index(number) + 1)%4 == 0
        conversion << number + keys[3]
      elsif (numeric.find_index(number) + 1)%3 == 0
        conversion << number + keys[2]
      elsif (numeric.find_index(number) + 1)%2 == 0
        conversion << number + keys[1]
      else (numeric.find_index(number) + 1)%1 == 0
        conversion << number + keys[0]
      end
    # require 'pry'; binding.pry
    # split_message = message.split("")
    # position = split_message.map { |letter| letter.bytes - 96 }
    # char_pos = characters.zip(position)
    end
    require 'pry'; binding.pry
  end
end