require_relative 'enigma'
require 'date'

incoming_message = File.read(ARGV[0])
# message = incoming_message.read
enigma = Enigma.new
encrypted_message = enigma.encrypt(incoming_message, '02715', '040895')
todays_date = Date.today.strftime("%D").delete("/")

writer = File.write(ARGV[1], encrypted_message[:encryption])
# writer.write(encrypted_message[:encryption])
# require 'pry'; binding.pry
if encrypted_message[:date] == ''
  puts "Created #{ARGV[1]} with the key #{encrypted_message[:key]} and date #{todays_date}"
else
  puts "Created #{ARGV[1]} with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
end