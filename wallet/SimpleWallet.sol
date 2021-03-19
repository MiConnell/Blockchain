pragma solidity ^0.7.4;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/access/Ownable.sol"

contract SimpleWallet is Ownable {

    mapping(address => uint) public allowance;

    function addAllowance(address _who, uint _amount) public onlyOwner {
        allowance[_who] = _amount;
    }

    modifier ownerOrAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >= _amount, "you are not allowed")
    }

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        _to.transfer(_amount);
    }

    fallback() external payable {

    }


}
