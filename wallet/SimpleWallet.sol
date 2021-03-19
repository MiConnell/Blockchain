pragma solidity ^0.7.4;


contract SimpleWallet {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // verify that owner of the funds is the message sender
    modifier onlyOwner() {
        require(owner == msg.sender, "you are not allowed");
        _;
    }

    // use modifier to ensure only the owner can interact with the funds
    function withdrawMoney(address payable _to, uint _amount) public onlyOwner {
        _to.transfer(_amount);
    }

    fallback() external payable {

    }


}
