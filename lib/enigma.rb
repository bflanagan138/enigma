class Enigma
  attr_reader :character_set, 
              :keys
  def initialize
    @character_set = ("a".."z").to_a << " "
    @keys = []
  end

  #helper method for encrypt
  def key_generator
    rand(99999).to_s.rjust(5, "0")
  end
  
  #helper method for encrypt
  def todays_date
    Date.today.strftime("%D").delete("/")
  end
  
  def keys
    require 'pry'; binding.pry
  end
  #shift conventions
    #a_shift = a_key + a_offset
    #b_shift = b_key + b_offset
    #c_shift = c_key + c_offset
    #d_shift = d_key + d_offset

  def encrypt(message, shift = key_generator, offset = todays_date)
    message.split('')
  end
end