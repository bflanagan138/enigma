require_relative 'enigma'

message = File.open(ARGV[0], "r")
key = ARGV[2].to_s 
date = ARGV[3].to_s
incoming_message = message.read
enigma = Enigma.new
encrypted_message = enigma.encrypt(incoming_message, key, date)

writer = File.open(ARGV[1], "w")
writer.write(encrypted_message[:encryption])
puts "created #{ARGV[1]} with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"