require_relative 'enigma'
require 'date'

encrypted_message = File.read(ARGV[0])
key = ARGV[2]
date = ARGV[3]
# encrypted_message = encrypted_message.read
enigma = Enigma.new
decrypted_message = enigma.decrypt(encrypted_message, key, date)

writer = File.write(ARGV[1], decrypted_message[:decryption])
# writer.write(decrypted_message[:decryption])
puts "Created #{ARGV[1]} with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"