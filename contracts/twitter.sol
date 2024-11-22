// SPDX-License-Identifier: MIT

pragma solidity  ^0.8.26;

contract Twitter{
    struct Tweet {
        uint256 id;
        address author;
        string  content;
        uint256 timestamp;
        uint256 likes;
    }
    address public owner;
    uint112 public  maxTweetLength= 200;
    mapping(address => Tweet[]) public tweets;
     constructor(){
        owner=msg.sender;
    }
    
    modifier onlyOwner(){
        require(owner == msg.sender, "you are not the owner");
        _;
    }
    function changeTweetLength(uint112 newTweetLength)public onlyOwner {
        maxTweetLength=newTweetLength;
    }
    function CreateTweet(string memory _content ) public{
        require(bytes(_content).length <= maxTweetLength, "Tweet  is too long");
        Tweet memory newTweet=Tweet({
            id: tweets[msg.sender].length,
            author:msg.sender,
            content:_content,
            timestamp:block.timestamp,
            likes:0
        });
        tweets[msg.sender].push(newTweet);
    }
    function likeTweet(uint256 id, address author) external {
        require(tweets[author][id].id == id, "tweet does not exist");
        tweets[author][id].likes++;
    }
    function unlikeTweet(uint256 id, address author)external{
        require(tweets[author][id].id == id, "tweet does not exist");
        require(tweets[author][id].likes > 0, "You never like this tweet before");
        tweets[author][id].likes--;
    }
    function getTweet( uint _id)public view returns  (Tweet memory ){
        return tweets[msg.sender][_id];
    }
    function getAllTweet(address _owner)public view returns (Tweet[] memory){
        return tweets[_owner];
    }
}
