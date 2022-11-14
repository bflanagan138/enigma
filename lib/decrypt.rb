require_relative 'enigma'
require 'date'

message = File.open(ARGV[0], "r")
key = ARGV[2]
date = ARGV[3]
encrypted_message = message.read
enigma = Enigma.new
decrypted_message = enigma.decrypt(encrypted_message, key, date)

writer = File.open(ARGV[1], "w")
writer.write(decrypted_message[:decryption])
puts "Created #{ARGV[1]} with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"