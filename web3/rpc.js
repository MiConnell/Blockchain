let Web3 = require("web3");

let web3 = new Web3(new Web3.providers.HttpProvider("HTTP://127.0.0.1:8545"));

web3.eth.call({
    from: "0x288550B0cB70342969DC391a05401eD8c0e14509",
    to: "0x941893ABe53F8C09EA1dA6BEc9d143eE1172fCf5",
    data: "0x06540f7e",  // function signature hash
    // also could be data: web3.utils.sha3("myUint()")
}).then(console.log);

console.log(web3.utils.sha3("myUint()"));


// 0x06540f7eac53ad8a460dca00c89ac4438982ca36ff3248355f14b688948f672a
// first four bytes are the same as the data field

/***
 * Remix-deployed contract
 * Smart Contract address 0x941893ABe53F8C09EA1dA6BEc9d143eE1172fCf5
 *
 *        pragma solidity ^0.5.15;
 *
 *        contract SomeContract {
 *
 *            uint public myUint = 10;
 *            function setUint(uint _myUint) public {
 *
 *                myUint = _myUint;
 *            }
 *        }
 *
***/


let contract = new web3.eth.Contract(
    [
	{
		"constant": true,
		"inputs": [],
		"name": "myUint",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_myUint",
				"type": "uint256"
			}
		],
		"name": "setUint",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	}
],
    "0x941893ABe53F8C09EA1dA6BEc9d143eE1172fCf5"
)

// contract object now contains contract information and variables
// we can now interact with the contract

contract.methods.myUint().call().then(console.log)

contract.methods.setUint(69420).send(
    {
        from: "0x288550B0cB70342969DC391a05401eD8c0e14509"
    }
).then(console.log);
