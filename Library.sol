pragma solidity ^0.8.7;

contract Library {
    mapping(address=> uint) public tokenBalance;
    constructor() public {
        tokenBalance[msg.sender]=1;
    }

    function sendToken(address _to,uint _amount) public  returns(bool){
        tokenBalance[msg.sender]-=_amount;
        tokenBalance[_to]+= _amount;

        return true;
    }

}