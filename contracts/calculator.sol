// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.26;

contract calculator{
  uint64 result =0;
  function add(uint64 num) public {
    result += num;
  }
  function subtract (uint64 num) public {
    result-=num;
  }
  function multiply (uint64 num) public {
    result *= num;
  }
  function get() public view returns (uint64) {
    return  result;
  }
}