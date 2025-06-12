// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NexusLuckySpin {
    event SpinResult(address indexed player, bool win, uint256 prizeAmount);
    mapping(address => uint256) public playerWins;
    uint256 public prizeAmount = 10 ether; // Example prize amount

    function spin() public returns (bool) {
        // Pseudo-randomness for demo (not secure for real value!)
        uint256 rand = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, block.difficulty))) % 2;
        bool win = rand == 1;
        if (win) {
            playerWins[msg.sender] += prizeAmount;
        }
        emit SpinResult(msg.sender, win, win ? prizeAmount : 0);
        return win;
    }

    // Admin can set prize amount
    function setPrizeAmount(uint256 amount) public {
        prizeAmount = amount;
    }

    function getWins(address player) public view returns (uint256) {
        return playerWins[player];
    }
} 