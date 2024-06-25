"# Twitter.sol" 

The first step in the development of this project was the creation of the mapping, which will have the function of saving a tweet and linking it to the user who created it.

The next step was the creation of the createTwitter function, where I was able to learn that we need to use "memory" in the function parameter, to indicate that that value 
should be stored in temporary memory to then be used again, and I was also able to learn about the msg object , which is an object provided by the blockchain and has, among
other information, the network user's wallet address, a value that can be accessed and used through "msg.sender".

Furthermore, I was also able to learn about what mappings are, and the most important thing is to understand that they have a key and a value, the keys are basically a 
number that represents some type of information, this information in turn, is a value unique, like a code for example.