// SPDX-License-Identifier: GPL-3.0
pragma solidity ^ 0.7.0;

import './AccessControlled.sol';

contract Voting is AccessControlled{

        struct Vote {
        address receiver;
        uint256 timestamp;
    }

    mapping(address => Vote) public votes;

    //events

    event AddVote(address indexed voter, address receiver, uint256 timestamp);
    event RemoveVote(address voter);
    event StartVoting(address startedBy);
    event StopVoting(address stoppedBy);

    // //main constructor
    // constructor() public {
    //     isVoting = false;
    // }

    function startVoting() external returns (bool) {
        isVoting = true;
        emit StartVoting(msg.sender);
        return true;
    }

    function stopVoting() external isVotingOpen returns (bool){
        isVoting = false;
        emit StopVoting(msg.sender);
        return true;
    }

    function addVote(address receiver) external isVotingOpen returns (bool){
        require(receiver != address(0), "Wrong input paramters");
        // address(0) is an address with all zero values. If the recievr has not sent any particluar imput parameter or wrongly formatted.
        // Then it will be equal to address(0). In that case the require would fail stating sender of function has not given proper input paramater
        votes[msg.sender].receiver = receiver;
        votes[msg.sender].timestamp = block.timestamp;
        emit AddVote(msg.sender, receiver, block.timestamp);
    }

    function removeVote() external returns (bool){
        require(votes[msg.sender].timestamp > 0, "This person has not voted yet");
        delete votes[msg.sender];
        emit RemoveVote(msg.sender);
        return true;
    }

    function getVote(address voterAddress) external view returns (address candidateAddress){
        return votes[voterAddress].receiver;
    }
}