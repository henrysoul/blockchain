pragma solidity ^0.8.7;
contract SendMoneyExample{
    uint public balanceReived;
    function reveiveMoney() public payable{
        balanceReived +=msg.value;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function withdrawMoney() public{
        address payable  to = payable(msg.sender);

        to.transfer(this.getBalance());
    }

    function withdrawMoneyTo(address payable _to) public{
        _to.transfer(this.getBalance());
    }
} 