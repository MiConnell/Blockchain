pragma solidity ^0.7.4;

contract WorkingWithVariables {
    uint256 public myUint;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    bool public myBool;

    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }

    uint8 public myUint8;

    function incrementUint() public {
        myUint8++;
    }

    function decrementUint() public {
        myUint8--;
    }

    address public myAddress;

    function setAddress(address _address) public {
        myAddress = _address;
    }

    function getBalance() public view returns(uint) {
        return myAddress.balance;
    }

    string public myString = 'hello world';

    function setMyString(string memory _myString) public { // strings need to be stored in memory instead of a variable and are immutable
        myString = _myString;
    }
}