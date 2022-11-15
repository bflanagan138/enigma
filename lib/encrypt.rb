require_relative 'enigma'
require 'date'

incoming_message = File.open(ARGV[0], "r")
message = incoming_message.read
enigma = Enigma.new
encrypted_message = enigma.encrypt(message)
todays_date = Date.today.strftime("%D").delete("/")

writer = File.open(ARGV[1], "w")
writer.write(encrypted_message[:encryption])
# require 'pry'; binding.pry

if encrypted_message[:date] == ''
  puts "Created #{ARGV[1]} with the key #{encrypted_message[:key]} and date #{todays_date}"
else
  puts "Created #{ARGV[1]} with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
end