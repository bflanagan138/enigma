***Welcome to my Enigma final project!***

This project is a cipher program that accepts a message from a .txt file into the encrypt.rb file, encrypts it based on an encryption key, and then outputs it to another .txt file. Upon completion of the encryption, the terminal command line will output a statement that it has created the file.txt with the key and date (which will be necessary to decrypt, more on that later)

The encryption key takes in a provided 5 digit key string and a 6 digit date string (ddmmyy) or if neither are given, generates a random 5 digit key and assigns todays date. It then manipulates that information to generate 4 different encryption shifts that are applied consecutively across the message to encrypt characters. 

Any characters may be entered into the message file, however only the letter of the alphabet (a-z / A-Z) and the space will be individually encrypted. Other characters will not be encrypted, rather they will be passed through to the encrypted message unchanged. 

Further, once a message has been encrypted, it can then be decrypted. The message can be called using the decrypt.rb file and referencing the key and date. When it is run, it will return the same message as was encrypted prior, the only difference will be that all letters are lowercase.

***Encryption***
To begin encryption, open the english.txt file and type in your message to be encrypted
In your terminal from the Enigma root directory, type in ruby lib/encrypt.rb english.txt encrypted.txt
Make note of the <key> and <date> returned in the command line (these will be required for decryption)
Open the encrypted.txt file to view the encrypted file

***Decryption***
* To begin decryption (once you have encrypted a file), in your terminal from the Enigma root directory, type in <ruby lib/decrypt.rb encrypted.txt decrypted.txt <key> <date>
Open the decrypted.txt file to view the decrypted file. It should be identical to the original english.txt file except all lowercase
  
***Project Reflections***
I have learned more from this project than any other project, individual classes or exercises in my time at Turing. Not only has this project given me the opportunity to practice technical coding, thinking through logic and creating a working project from scratch that reads and writes between files, but it also has illustrated for me some of the challenges I still struggle with in learning to code. 
  
Regarding the evaluation rubric:
Strengths and successes  
1. My Enigma class with encrypt and decrypt methods are successfully implemented. My encrypt/decrypt command line interfaces are successfully implemented
2. My project is broken into logical components and appropriately encapsulated
3. My code is properly indented / spaced, my naming conventions are appropriate. I've done my best to play with enumerables and data structures to identify what I believe are the most appropriate for their given application. Hashes are used for the output where message, key and date are keyed to their respective values
4. I am writing tests prior to writing code, and both unit and integration testing. I've done my best to think through to address edge cases. Spec helper indicates 96%+ coverage. All tests pass
5. I have multiple pull requests 
4.
