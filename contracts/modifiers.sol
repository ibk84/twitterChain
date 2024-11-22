// SPDX-License-Identifier: MIT

pragma solidity  ^0.8.26;

contract PausibleContract{
    address public  owner;
    bool public  paused;
    mapping(address=>uint) user;
    constructor(){
        owner=msg.sender;
        paused=false;
        user[owner]=1000;

    }
modifier onlyOwner(){
    require(msg.sender == owner, "not the owner");
    _;
}
modifier ContractNotPaused(){
    require(paused, "is paused");
    _;
}
}