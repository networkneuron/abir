// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NexusFortuneCookie {
    string[] public fortunes;
    mapping(address => string[3]) public userFortunes;
    mapping(address => uint8) public userFortuneIndex;

    event FortuneOpened(address indexed user, string fortune);

    constructor() {
        fortunes.push("You will have a great day!");
        fortunes.push("A new opportunity is coming.");
        fortunes.push("Nexus brings you luck!");
        fortunes.push("You will make a new friend.");
        fortunes.push("A surprise is waiting for you.");
        fortunes.push("Your code will compile on the first try.");
        fortunes.push("You will discover something amazing.");
        fortunes.push("A small act of kindness will return to you.");
        fortunes.push("You are a true Nexus fan!");
        fortunes.push("The future is bright on the blockchain.");
    }

    function openCookie() public returns (string memory) {
        uint256 rand = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, block.difficulty))) % fortunes.length;
        string memory fortune = fortunes[rand];
        userFortunes[msg.sender][userFortuneIndex[msg.sender]] = fortune;
        userFortuneIndex[msg.sender] = (userFortuneIndex[msg.sender] + 1) % 3;
        emit FortuneOpened(msg.sender, fortune);
        return fortune;
    }

    function getMyFortunes() public view returns (string[3] memory) {
        return userFortunes[msg.sender];
    }

    function getAllFortunes() public view returns (string[] memory) {
        return fortunes;
    }
} 