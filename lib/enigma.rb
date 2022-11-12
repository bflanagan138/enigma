class Enigma
  attr_reader :character_set, 
              :final_shift
  def initialize
    @character_set = ("a".."z").to_a << " "
    @final_shift = {}
  end

  #helper method for encrypt
  def key_generator
    rand(99999).to_s.rjust(5, "0")
    # "12345"
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
    # require 'pry'; binding.pry
  end

  def encrypt(message, shift = key_generator, offset = todays_date)
    message.split('')
  end
end