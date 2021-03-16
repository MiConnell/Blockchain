pragma solidity ^0.7.4;

contract StartStopUpdate {
    address owner;

    bool public paused;

    constructor() public {
        owner = msg.sender;
    }

    function sendMoney() public payable {

    }

    function setPaused(bool _paused) public {
       require(msg.sender == owner, "oh no you don't!");
       paused = _paused;
    }

    function destroyContract(address payable _to) public {
        require(msg.sender == owner, "oh no you don't!");
        selfdestruct(_to);
    }

    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, "oh no you don't!");
        require(!paused, "oh no you don't!");
        _to.transfer(address(this).balance);
    }
}
