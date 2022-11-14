require_relative 'enigma'
require 'date'

message = File.open(ARGV[0], "r")
encrypted_message = message.read
enigma = Enigma.new
decrypted_message = enigma.decrypt(encrypted_message, '02714', '040895')

writer = File.open(ARGV[1], "w")
writer.write(decrypted_message[:decryption])
puts "Created #{ARGV[1]} with the key #{enigma.key} and date #{enigma.offsets} } "