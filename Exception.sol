pragma solidity ^0.8.7;

contract Exception {
    mapping(address => uint) public balanceReceived;

    function reveiveMoney() public payable{
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public{
        require(_amount <= balanceReceived[msg.sender],"you don't have enough money");
        balanceReceived[msg.sender]-= _amount;
        _to.transfer(_amount);
    }
}