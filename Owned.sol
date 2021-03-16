pragma solidity ^0.7.4;

contract Owned {
    address owner;

    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        // need to add the modifier between public and curly brackets for the
        // functions that will use it
        require(msg.sender == owner, "oh no you don't!");
        _;
        // the function body during compilation is being copied to the modifier
        // ond then back to the function body
    }

}
