// SPDX-License-Identifier: MIT

pragma solidity  ^0.8.26;

contract Twitter{
    struct Tweet {
        address author;
        string  content;
        uint256 timestamp;
        uint256 likes;
    }
    mapping(address => Tweet[]) public tweets;

    function CreateTweet(string memory _tweet) public{
        Tweet memory newTweet=Tweet{
            
        };
        tweets[msg.sender].push(_tweet);
    }
    function getTweet(address _owner, uint _id)public view returns  (string memory ){
        return tweets[_owner][_id];
    }
    function getAllTweet(address _owner)public view returns (string[] memory){
        return tweets[_owner];
    }
}
