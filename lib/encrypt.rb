message = File.open(ARGV[0], "r")
incoming_message = message.read
message.close

message_to_encrypt = incoming_message
writer = File.open(ARGV[1], "w")
writer.write(message_to_encrypt)
writer.close