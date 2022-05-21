pragma solidity ^0.8.7;
contract Function{
    mapping(address => uint) public balanceReceived;

    address payable owner;

    constructor() public{
        owner = payable(msg.sender);
    }

    function getOwner() public view returns(address){
        return owner;
    }

    /**
        pure function is a function that does not interact with variables in a contract
        a pure function can call another pure function but cannot call 
        a view function or another kind of function.

        a view function can call a view function, pure function and another funtion that 
        is not a writing function

        writing function can call any kind of function
    **/
    function convertWeiToEther(uint _amountInWei) public pure returns(uint){
        return _amountInWei / 1 ether;
    }

    function destroySmartContract() public{
        require(msg.sender == owner,"You are not the owner");
        selfdestruct(owner);
    }

    function reveiveMoney() public payable{
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public payable{
        require(_amount <= balanceReceived[msg.sender],"you don't have enough money");
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender]-= _amount;
        _to.transfer(_amount);
    }

   fallback () external payable{
        reveiveMoney();
    }

    receive () external payable{
        reveiveMoney();
    }
}