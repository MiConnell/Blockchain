pragma solidity ^0.7.4;

contract MappingStructExample {

    mapping(address => uint) public balanceReceived;

    function gitBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceReceived[msg.sender] >= _amount, "no way");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balanceToSend);
    }

    // checks effect interactions pattern

        // check if you can do something
        // then make sure that the effect on the state of the smart contract is done correctly
        // interact with anything outside of the smart contract

    // update first then interact
}
