![Enigma pic Medium](https://user-images.githubusercontent.com/109649285/201985492-f5d62df9-4038-49b0-a735-59c954c0e9d4.jpeg)

***Welcome to ENIGMA***
                                                                                               
This project is a cipher program that accepts a message from a .txt file into the encrypt.rb file, encrypts it based on an encryption key, and then outputs it to another .txt file. Upon completion of the encryption, the terminal command line will output a statement that it has created the file.txt with the key and date (which will be necessary to decrypt, more on that later)

The encryption key takes in a provided 5 digit key string and a 6 digit date string (ddmmyy) or if neither are given, it will generate a random 5 digit key and assign todays date. It then manipulates that information to generate 4 different encryption shifts that are applied consecutively across each of the characters in the message to encrypt them. 

Any characters may be entered into the message file, however only the letters of the alphabet (a-z / A-Z) and space will be encrypted. Other characters will not be encrypted, rather they will be passed through to the encrypted message unchanged. 

Further, once a message has been encrypted, it can then be decrypted. The message can be called using the decrypt.rb file and referencing the key and date. When it is run, it will return the same message as was encrypted prior, the only difference will be that all letters will now be lowercase.

***Encryption***
* To encrypt a message: 
* Open the english.txt file and type in your message to be encrypted
* In your terminal from the Enigma root directory, type in < ruby lib/encrypt.rb english.txt encrypted.txt >
* Make note of the < key > and < date > returned in the command line (these will be required for decryption)
* Open the encrypted.txt file to view the encrypted file

***Decryption***
* To decrypt your now encrypted message:
* In your terminal from the Enigma root directory, type in < ruby lib/decrypt.rb encrypted.txt decrypted.txt key date >
* Open the decrypted.txt file to view the decrypted file. It should be identical to the original english.txt file except letters will all be lowercase
  
***Project Reflections***
I have learned so much from working on Enigma! Not only has this project given me the opportunity to practice technical coding skills, thinking through logic and creating a working project from scratch that reads and writes between files, but it also has illustrated for me some of the challenges I still struggle with in learning to code. 
  
Regarding the evaluation rubric:
  
***Strengths and successes***  
1. My Enigma class with encrypt and decrypt methods are successfully implemented, I've also implemented a shift module for the enigma class. My encrypt/decrypt command line interfaces are both successfully implemented and I refactored them to be a concise as I feel they can be.
2. My project is broken into logical components and appropriately encapsulated, my files are not excessively long. 
3. My code is properly indented / spaced, my naming conventions are appropriate. I've done my best to play with enumerables and data structures to identify what I believe are the most appropriate for their given application. Hashes are used for the output where :message, :key and :date are keyed to their respective values
4. I am writing tests prior to writing code, and both unit and integration testing. I've done my best to address edge cases. Spec helper indicates 100% coverage, all tests pass
5. I have 11 pull requests and more than 90 commits. With a few exceptions I've committed regularly and separated my commits into appropriate pull requests. 
6. It works!

***Areas for Improvement***
1. My encrypt and decrypt methods are still longer than I would like. Additionally, I tried using .map in the latter half of my decrypt method and it didn't work, still not sure why so I did rely on using the .each method. 
2. While I feel that my naming conventions are appropriate, some may be a bit long. For additional refactoring I would put effort into making them more concise.
3. There were a few times I got carried away writing code and didn't commit changes often enough. I recognized that when I'm making edits which cause code to break, I'm now more comfortable moving through it to find new solutions than I was a few weeks ago. However this project illustrated for me that when code is breaking but I do feel that progress is being made, I still don't commit changes individually until I can see that I'm back on the right track. That will change in the future as I get more consistent, and I feel the latter half of my time on this project illustrates that I am getting more consistent with commits even when tests are still failing but I'm making progress.

As a whole, I'm really excited about my progress and learning this inning, and Enigma has illustrated for me how much I have grown. 
