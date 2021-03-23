pragma solidity ^0.7.4;

contract Ownable {
    address payable _owner;

    constructor() {
        _owner = msg.sender;
    }


    modifier onlyOwner() {
        require(isOwner(), "You are not the owner");
        _;
    }

    function isOwner() public view returns(bool) {
        return (msg.sender == _owner);
    }
}
