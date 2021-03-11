pragma solidity ^0.7.4;

contract FunctionExample {
    mapping(address => uint) public balanceReceived;

    address payable owner;

    constructor() public {
        owner = msg.sender;
        // automatically executed on deployment and cannot be called again
    }

    function getOwner() public view returns(address) {
        return owner;
    }

    function convertWeiToEther(uint _amountInWei) public pure returns(uint) {
        return _amountInWei / 1 ether;

    }

    function destroySmartContract() public {
        require(msg.sender == owner, "you are not the owner of");
        selfdestruct(owner);
    }

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
        // used to validate user input
        // will return unused gas
        require(_amount <= balanceReceived[msg.sender], "not enough money");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);

        // assert
        // used to validate internal states
        // will not return unused gas
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);


        function () external payable {
            //fallback function
            // argument data is in msg.data
            receiveMoney();
        }
    }
}
