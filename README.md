![Enigma pic Medium](https://user-images.githubusercontent.com/109649285/201985492-f5d62df9-4038-49b0-a735-59c954c0e9d4.jpeg)

***Welcome to***
███████ ███    ██ ██  ██████  ███    ███  █████  
██      ████   ██ ██ ██       ████  ████ ██   ██ 
█████   ██ ██  ██ ██ ██   ███ ██ ████ ██ ███████ 
██      ██  ██ ██ ██ ██    ██ ██  ██  ██ ██   ██ 
███████ ██   ████ ██  ██████  ██      ██ ██   ██                                                            
This project is a cipher program that accepts a message from a .txt file into the encrypt.rb file, encrypts it based on an encryption key, and then outputs it to another .txt file. Upon completion of the encryption, the terminal command line will output a statement that it has created the file.txt with the key and date (which will be necessary to decrypt, more on that later)

The encryption key takes in a provided 5 digit key string and a 6 digit date string (ddmmyy) or if neither are given, generates a random 5 digit key and assigns todays date. It then manipulates that information to generate 4 different encryption shifts that are applied consecutively across the message to encrypt characters. 

Any characters may be entered into the message file, however only the letter of the alphabet (a-z / A-Z) and the space will be individually encrypted. Other characters will not be encrypted, rather they will be passed through to the encrypted message unchanged. 

Further, once a message has been encrypted, it can then be decrypted. The message can be called using the decrypt.rb file and referencing the key and date. When it is run, it will return the same message as was encrypted prior, the only difference will be that all letters are lowercase.

***Encryption***
* To encrypt a message, open the english.txt file and type in your message to be encrypted
* In your terminal from the Enigma root directory, type in ruby lib/encrypt.rb english.txt encrypted.txt
* Make note of the <key> and <date> returned in the command line (these will be required for decryption)
* Open the encrypted.txt file to view the encrypted file

***Decryption***
* To decrypt your now encrypted message
* In your terminal from the Enigma root directory, type in ruby lib/decrypt.rb encrypted.txt decrypted.txt <key> <date>
* Open the decrypted.txt file to view the decrypted file. It should be identical to the original english.txt file except letters will all be lowercase
  
***Project Reflections***
I have learned so much from working on Enigma! Not only has this project given me the opportunity to practice technical coding skills, thinking through logic and creating a working project from scratch that reads and writes between files, but it also has illustrated for me some of the challenges I still struggle with in learning to code. 
  
Regarding the evaluation rubric:
  
***Strengths and successes***  
1. My Enigma class with encrypt and decrypt methods are successfully implemented. My encrypt/decrypt command line interfaces are successfully implemented
2. My project is broken into logical components and appropriately encapsulated
3. My code is properly indented / spaced, my naming conventions are appropriate. I've done my best to play with enumerables and data structures to identify what I believe are the most appropriate for their given application. Hashes are used for the output where message, key and date are keyed to their respective values
4. I am writing tests prior to writing code, and both unit and integration testing. I've done my best to think through to address edge cases. Spec helper indicates 96%+ coverage. All tests pass
5. I have more than 4 pull requests and more than 40 commits. With a few exceptions I've committed regularly and separated my commits into appropriate pull requests. 
6. It works!

***Areas for Improvement***
1. My encrypt.rb required an if statement to output the date correctly based on which date was used (todays date or provided date). I know this is because my enigma class is not as clearly and concisely written as it should be. While not ideal, I was happy to have been able to find a working solution even if it is not an optimized solution.
2. Speaking of the enigma class, it should definitely be refactored. My encrypt and decrypt methods are too long and do too much and should be broken down into helper methods. Existing helper methods should be separated into other classes / modules. I have a branch I've been working on to address this, however I did not get it completed in time to submit. Working through this project makes me realize how much I still get confused with scope and with breaking down large methods into smaller, more digestible bits.
3. While my naming conventions are appropriate, I feel that some may be a bit long. Could put effort into making them more concise.
4. There were a few times I got carried away writing code and didn't commit changes often enough. I recognized that when I'm making edits which cause code to break, I'm now more comfortable moving through it to find new solutions than I was a few weeks ago. However this project illustrated for me that when code is breaking but I do feel that progress is being made, I still don't commit changes individually until I can see that I'm back on the right track. That will change in the future as I get more consistent, and I feel the latter half of my time on this project illustrates that I am making progress.

As a whole, I'm really excited about my progress and learning this inning, and Enigma has illustrated for me how much I have grown. 
