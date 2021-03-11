pragma solidity ^0.7.4;

contract SimpleMappingExample {
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }
}
