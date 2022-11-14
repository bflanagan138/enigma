require_relative 'enigma'
require 'date'

message = File.open(ARGV[0], "r")
incoming_message = message.read
enigma = Enigma.new
encrypted_message = enigma.encrypt(incoming_message, '02715', '040895')

writer = File.open(ARGV[1], "w")
writer.write(encrypted_message[:encryption])
puts "created #{ARGV[1]} with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"