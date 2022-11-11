class Enigma

  def initialize
  end

  #helper method for encrypt
  def key_generator
    rand(99999).to_s
  end
  
  def todays_date
    Date.today.strftime("%D").delete("/")
  end
end