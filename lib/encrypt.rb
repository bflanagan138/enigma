require_relative 'enigma'
require 'date'

incoming_message = File.open(ARGV[0])
enigma = Enigma.new
encrypted_message = enigma.encrypt(message)

writer = File.open(ARGV[1], "w")
writer.write(encrypted_message[:encryption])
puts "Created #{ARGV[1]} with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"