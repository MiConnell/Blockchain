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

    function reduceAllowance(address _who, uint _amount) internal {
        require(_amount <= address(this).balance, "not enough funds")
        allowance[_who] -= _amount;
    }

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        if(!isOwner()) {
            reduceAllowance(msg.sender, _amount)
        }
        _to.transfer(_amount);
    }

    fallback() external payable {

    }


}
