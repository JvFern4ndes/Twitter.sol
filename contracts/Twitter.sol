// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";

pragma solidity ^0.8.26;

interface IProfile {
    struct UserProfile {
        string displayName;
        string bio;
    }

    function getProfile(address _user) external view returns(UserProfile memory);
}

contract Twitter is Ownable {

    uint16 public MAX_TWEET_LENGTH = 280;

    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;

    IProfile profileContract;

    modifier onlyRegistered(){
        IProfile.UserProfile memory userProfileTemp = profileContract.getProfile(msg.sender);
        require(bytes(userProfileTemp.displayName).length > 0, "USER NOT REGISTERED");
        _;
    }

    event createdTweet(uint256 id, address author, string content, uint256 timestamp);
    event TweetLiked(address liker, address tweetAuthor, uint256 tweetId, uint256 newLikeCount);
    event TweetUnliked(address unliker, address tweetAuthor, uint256 tweetId, uint256 newLikeCount);

    constructor(address initialOwner, address _profileContract) Ownable(initialOwner) {
        profileContract = IProfile(_profileContract);
    }

    function changeTweetLength(uint16 newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLength;
    }

    function getTotalLikes(address _author) external view returns(uint) {
        uint totalLikes;

        for (uint i = 0; i < tweets[_author].length; i++ ) {
            totalLikes += tweets[_author][i].likes;
        }

        return totalLikes;
    }

    function createTweet(string memory _tweet) public {
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "This Tweet is too long!");

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);

        emit createdTweet(newTweet.id, newTweet.author, newTweet.content, newTweet.timestamp);
    }

    function likeTweet(address author, uint256 id) external {
        require(tweets[author][id].id == id, "TWEET DOES NOT EXIST");

        tweets[author][id].likes++;

        emit TweetLiked(msg.sender, author, id, tweets[author][id].likes);
    }

    function unlikeTweet(address author, uint256 id) external {
        require(tweets[author][id].id == id, "TWEET DOES NOT EXIST");
        require(tweets[author][id].likes > 0, "TWEET HAS NO LIKES");

        tweets[author][id].likes--;

        emit TweetUnliked(msg.sender, author, id, tweets[author][id].likes);
    }

    function getTweet(uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }

}