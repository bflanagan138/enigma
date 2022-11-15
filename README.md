# enigma
Turing Mod 1 final solo project

Welcome to my Enigma final project! 

This project is a cipher program that accepts a message from a .txt file into the encrypt.rb file, encrypts it based on an encryption key, and then outputs it to another .txt file. Upon completion of the encryption, the terminal command line will output a statement that it has created the file.txt with the key and date (which will be necessary to decrypt, more on that later)

The encryption key takes in a provided 5 digit key string and a 6 digit date string (ddmmyy) or if neither are given, generates a random 5 digit key and assigns todays date. It then manipulates that information to generate 4 different encryption shifts that are applied consecutively across the message to encrypt characters. 

Any characters may be entered into the message file, however only the letter of the alphabet (a-z / A-Z) and the space will be individually encrypted. Other characters will not be encrypted, rather they will be passed through to the encrypted message unchanged. 

Further, once a message has been encrypted, it can then be decrypted. The message can be called using the decrypt.rb file and referencing the key and date. When it is run, it will return the same message as was encrypted prior, the only difference will be that all letters are lowercase.