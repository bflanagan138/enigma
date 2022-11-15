require_relative 'enigma'
require_relative 'shift'
require 'date'

incoming_message = File.read(ARGV[0])
enigma = Enigma.new
encrypted_message = enigma.encrypt(incoming_message)

writer = File.write(ARGV[1], encrypted_message[:encryption])
puts "Created #{ARGV[1]} with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"