pragma solidity ^0.8.7;

contract Mapping {
    mapping(uint => bool) public myMapping;
    
    function setValue(uint _index) public{
        myMapping[_index]= true;
    }
}