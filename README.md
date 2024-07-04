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

7 - At this stage of the project, I learned about structs and then implemented the first struct in the contract. For this, I created the 
struct Tweet, then I changed the mapping string array to an array of structs, then changed the function
createTweet, creating an instance of the struct with its keys and values, and then passing this new instance to the push in 
array of tweets. Finally, I changed the getTweet and getAllTweets functions to bring the Tweet struct arrays, instead of the arrays 
of tweets.

8 - At this stage of the project I learned about requires, which are basically solidity conditionals, and then I implemented a character 
limit per tweet through require.

9 - In this step I created the changeTweetLength function, and for it to work I changed the MAX_TWEET_LENGTH variable from constant to public, 
otherwise it would not be possible to change its value.

10 - In this step I created a variable called owner, of type address, and then I created a constructor to define which address 
will be the owner of the contract. The constructor is "executed" during contract deployment, so its owner will be the one who 
deployed it.

11 - In this step I created the modifier that will be used in the changeTweetLength function, which will allow only the owner to 
be able to use the changeTweetLength function.

12 - In this step I applied the onlyOwner modifier to the changeTweetLength function, and then I carried out the tests and everything 
worked perfectly well, both the change by owner only and the size change proved to be effective.

13 - I added an id to the Tweet struct and then defined that this id will be the Tweet's position in the tweets array.

14 - In this step I created the functions to like and dislike tweets, for this I passed the tweet's author and id as function parameters, 
in addition, I created a require, which checks if that tweet with author and id really exists.

15 - At this stage of the project, I created the tweetLiked and tweetUnliked events and then created the emits in their respective functions, and I learned that the events 
serve to make real-world information available on the blockchain network, and then make this information more easily accessible, I also learned that this is more efficient 
than storing this information.

16 - At this stage of the project I developed the getTotalLikes function, responsible for pulling all the likes that a given user received on their tweets.
This function receives a parameter _author, where we define which user we want to view the likes of, within the function I created a variable called totalLikes, and used a loop,
which adds the likes of the author's tweets as long as i is less than the number of tweets that the author created. Finally, this function returns the totalLikes value. It is 
also worth remembering that this function is external, as it is not used anywhere else in the code, in addition it receives the "view" as it does not make any changes to the 
blockchain, it only retrieves the information contained in the blockchain, and marks it as view in the It helps save gas, and I also needed to define that the function returns 
data of type uint.

17- At this stage of the project, I learned how inheritance works within solidity, and to practice, I changed my custom modifier onlyOwner, to a standardized modifier from 
openzeppelin, a company responsible for providing standardized functionalities, such as security features for example, as is In the case of the onlyOwner modifier, it didn't 
work out at first, because the openZeppelin constructor receives an initialOwner parameter, which I wasn't passing within the Twitter contract, so I needed to pass this small 
adjustment, I ended up with an empty constructor, just to the modifier works, I need to research later to find out if this can have any negative impact