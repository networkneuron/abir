// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NexusGame {
    struct Node {
        uint256 x;
        uint256 y;
        uint256 z;
        address owner;
        uint256 timestamp;
    }

    struct Player {
        uint256 score;
        uint256 nodesDeployed;
        uint256 lastPuzzleSolved;
    }

    Node[] public nodes;
    mapping(address => Player) public players;
    mapping(string => bool) public validHashes;
    mapping(address => string[]) public playerHashes;

    event NodeDeployed(address indexed owner, uint256 x, uint256 y, uint256 z);
    event PuzzleSolved(address indexed player, string hash);
    event NetworkCreated(address indexed creator, uint256 nodeCount);

    constructor() {
        // Initialize some valid hashes for puzzles
        validHashes["abc123"] = true;
        validHashes["def456"] = true;
        validHashes["ghi789"] = true;
    }

    function deployNode(uint256 x, uint256 y, uint256 z) public {
        nodes.push(Node(x, y, z, msg.sender, block.timestamp));
        players[msg.sender].nodesDeployed++;
        emit NodeDeployed(msg.sender, x, y, z);
    }

    function getNodes() public view returns (Node[] memory) {
        return nodes;
    }

    function getPlayerStats(address player) public view returns (Player memory) {
        return players[player];
    }

    function verifyTransaction(string memory hash) public returns (bool) {
        if (validHashes[hash]) {
            players[msg.sender].score += 10;
            players[msg.sender].lastPuzzleSolved = block.timestamp;
            playerHashes[msg.sender].push(hash);
            emit PuzzleSolved(msg.sender, hash);
            return true;
        }
        return false;
    }

    function getPlayerHashes(address player) public view returns (string[] memory) {
        return playerHashes[player];
    }

    function addValidHash(string memory hash) public {
        // In a real implementation, this would be restricted to admin
        validHashes[hash] = true;
    }

    function getNetworkStats() public view returns (uint256 totalNodes, uint256 uniquePlayers) {
        totalNodes = nodes.length;
        uniquePlayers = 0;
        address[] memory seenPlayers = new address[](nodes.length);
        
        for (uint256 i = 0; i < nodes.length; i++) {
            bool isNew = true;
            for (uint256 j = 0; j < uniquePlayers; j++) {
                if (seenPlayers[j] == nodes[i].owner) {
                    isNew = false;
                    break;
                }
            }
            if (isNew) {
                seenPlayers[uniquePlayers] = nodes[i].owner;
                uniquePlayers++;
            }
        }
    }
} 