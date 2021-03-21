let Web3 = require("web3");

let web3 = new Web3(new Web3.providers.HttpProvider("HTTP://127.0.0.1:8545"));

web3.eth.getBalance("0x677F8051E787721507C8E711a09b7D776589aE56").then(
    function (result) { console.log(web3.utils.fromWei(result, "ether")); }
);

web3.eth.sendTransaction(
    {
        from: "0x288550B0cB70342969DC391a05401eD8c0e14509",
        to: "0x677F8051E787721507C8E711a09b7D776589aE56",
        value: web3.utils.toWei("1", "ether")
    }
);
