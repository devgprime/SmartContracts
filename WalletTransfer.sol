// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.0;

contract MyContract{
    mapping(address => uint256) public balances;
    address payable wallet;
    
    constructor(address payable _wallet){
        wallet = _wallet;
    }
    function buyToken() public payable{
        
        //buy a buyToken
        balances[msg.sender] += 1;
        wallet.transfer(msg.value);
        //send ether to wallet
        
    }
}