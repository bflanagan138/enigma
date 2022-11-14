require_relative 'enigma'
require 'date'

message = File.open(ARGV[0], "r")
incoming_message = message.read
enigma = Enigma.new
encrypted_message = enigma.encrypt(incoming_message)

writer = File.open(ARGV[1], "w")
writer.write(encrypted_message[:message])
# require 'pry'; binding.pry
puts "created #{ARGV[1]} with the key #{enigma.key} and date #{enigma.offsets} } "