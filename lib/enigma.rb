class Enigma
  attr_reader :character_set,
              :key
  def initialize
    @character_set = ("a".."z").to_a << " "
    @key = nil
  end

  def key_generator
    @key =
      if @key.nil?
        rand(99999).to_s.rjust(5, "0")
      else
        @key
      end
  end

  
  #helper method for encrypt
  def todays_date
    Date.today.strftime("%D").delete("/")
    # "040895"
  end
  
   def key_to_four_pairs
    final_keys = []
    split_keys = key_generator.split("")
    4.times do |i|
      final_keys << (split_keys[i] + split_keys[i + 1]).to_i
    end
    final_keys
  end


  def offsets
    ((todays_date.to_i ** 2)%10000).to_s.chars.map(&:to_i)
  end

  def final_shift
    # require 'pry'; binding.pry
    [keys, offsets].transpose.map do |number| 
      # require 'pry'; binding.pry
      number.sum
    end
  end

  def encrypt(message, keys = "", offsets = "")
    if keys == ""
      keys = key_generator
    end
    if offsets == ""
      offsets = todays_date
    end
    numeric = []
    message.bytes.each do |letter|
      require 'pry'; binding.pry
      if letter == 32
        numeric << letter - 6
      elsif (97..122).include?(letter)
        numeric << (letter - 96)
        # else 
        #message.bytes.reverse
        #figure out how to do above, ignore any other characters, return themselves
      end
    end
    conversion = []
    # require 'pry'; binding.pry
    numeric.each do |number|
      if (numeric.find_index(number) + 1)%4 == 0
        conversion << (number + final_shift[3])%27
        require 'pry'; binding.pry
      elsif (numeric.find_index(number) + 1)%3 == 0
        conversion << (number + final_shift[2])%27
        require 'pry'; binding.pry
      elsif (numeric.find_index(number) + 1)%2 == 0
        conversion << (number + final_shift[1])%27
        require 'pry'; binding.pry
      else (numeric.find_index(number) + 1)%1 == 0
        conversion << (number + final_shift[0])%27
        require 'pry'; binding.pry
      end
    end
    # require 'pry'; binding.pry
    # conversion.map do |number|
    #   # require 'pry'; binding.pry
    #   @character_set[number]
  
  end

end