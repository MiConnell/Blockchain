pragma solidity ^0.7.4;

contract ExceptionExample {
    mapping(address => uint) public balanceReceived;

    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;

    }

    function withdrawMoney(address payable _to, uint _amount) public {
        // different exceptions

        // if statement
        if(_amount <= balanceReceived[msg.sender]) {
            balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
        }

        // require
        require(_amount <= balanceReceived[msg.sender], "not enough money");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);

        // assert
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
    }
}
