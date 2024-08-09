// SPDX-License-Identifier: UNKNOWN 
pragma solidity ^0.8.21;

contract Voting {
// This mapping keeps track of each address’s voting status
mapping(address => bool) public hasVoted;

// This mapping stores the votes each candidate has received
mapping(bytes32 => uint) public votesReceived;

// An array of candidates eligible for votes
bytes32[] public candidates;

constructor(bytes32[] memory candidateNames) public {
candidates = candidateNames;
}

function voteForCandidate(bytes32 candidate) public {
require(!hasVoted[msg.sender], "You have already voted.");
require(validCandidate(candidate), "Candidate does not exist.");

hasVoted[msg.sender] = true;
votesReceived[candidate] += 1;
}

function validCandidate(bytes32 candidate) view public returns (bool) {
for (uint i = 0; i < candidates.length; i++) {
if (candidates[i] == candidate) {
return true;
}
}
return false;
}
}
// Explanation: This contract sets up a simple voting system where each Ethereum address can only vote once for a pre-defined list of candidates. The votes are tallied in a mapping, and basic checks ensure each address votes only once and for valid candidates.