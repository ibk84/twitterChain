// SPDX-License-Identifier: MIT

pragma solidity  ^0.8.26;

contract Twitter{
    struct Tweet {
        address author;
        string  content;
        uint256 timestamp;
        uint256 likes;
    }
    uint112 constant maxTweetLength= 200;
    mapping(address => Tweet[]) public tweets;

    function CreateTweet(string memory _content ) public{
        require(bytes(_content).length <= maxTweetLength, "Tweet  is too long");
        Tweet memory newTweet=Tweet({
            author:msg.sender,
            content:_content,
            timestamp:block.timestamp,
            likes:0
        });
        tweets[msg.sender].push(newTweet);
    }
    function getTweet(address _owner, uint _id)public view returns  (Tweet memory ){
        return tweets[_owner][_id];
    }
    function getAllTweet(address _owner)public view returns (Tweet[] memory){
        return tweets[_owner];
    }
}
