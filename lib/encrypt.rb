message = File.open(ARGV[0], "r")
incoming_message = message.read
message.close
# puts incoming_message
message_to_encrypt = incoming_message.downcase
writer = File.open(ARGV[1], "w")
writer.write(message_to_encrypt)
writer.close