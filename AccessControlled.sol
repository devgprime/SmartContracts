// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract AccessControlled {
    
    bool public isVoting;
    
    constructor(){
        isVoting = false;
    }
    
    modifier isVotingOpen() {
        require(isVoting == true, "Voting Process is not open");
        _;
    }
}


