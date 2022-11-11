class Enigma
  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  #helper method for encrypt
  def key_generator
    rand(99999).to_s
  end
  
  #helper method for encrypt
  def todays_date
    Date.today.strftime("%D").delete("/")
  end

  def encrypt(message, shift = key_generator, offset = todays_date)
    message.split('')
  end
end