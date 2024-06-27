"# Twitter.sol" 

1 - The first step in the development of this project was the creation of the mapping, which will have the function of saving a tweet and linking it to the user who created it.

2 - The next step was the creation of the createTwitter function, where I was able to learn that we need to use "memory" in the function parameter, to indicate that that value 
should be stored in temporary memory to then be used again, and I was also able to learn about the msg object , which is an object provided by the blockchain and has, among
other information, the network user's wallet address, a value that can be accessed and used through "msg.sender".

3 - Furthermore, I was also able to learn about what mappings are, and the most important thing is to understand that they have a key and a value, the keys are basically a 
number that represents some type of information, this information in turn, is a value unique, like a code for example.

4 - I created the getTweet function, responsible for bringing the tweets linked to my user, for this, I passed the address 
_owner as a function parameter, which in turn, will be responsible for requiring a wallet address for its execution, in 
addition, I indicated that the function is of the view type, as it does not make any modifications to the blockchain, it only 
brings data that is already registered in it, this is somehow efficient in relation to gas, finally, I also defined that this 
function returns a string that must be allocated in the memory.

5 - Then I changed the mapping address, from string to an array of strings. Additionally, I modified createTweet
function, so that instead of just assigning a new value to the tweets variable, a new value is added to the array. Also
I changed the getTweet function, so that in addition to passing an address as a function parameter, I have to pass the tweet index
I want to visualize inside the array.

6- I created the function to return all tweets, the function is very similar to listing just one tweet based on the index which is
passed as a parameter, the only difference is that this function does not have the index parameter.