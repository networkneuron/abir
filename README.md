# Nexus: Genesis Protocol

A 3D puzzle-adventure game for the Nexus Playground Level 2 contest, where players act as "Genesis Architects" building and securing the Nexus blockchain network.

---

## 🚀 Setup Instructions

### 1. Add Nexus Testnet to MetaMask
- Open MetaMask and click "Add Network".
- Use the following details:
  - **Network Name:** Nexus Layer 1
  - **Chain ID:** 393
  - **RPC URL:** https://rpc.nexus.xyz/http
  - **WebSocket URL:** wss://rpc.nexus.xyz/ws
  - **Block Explorer:** https://explorer.nexus.xyz
- Save the network.

### 2. Obtain Test $NEX Tokens
- Visit the Nexus Testnet II faucet (see [Nexus Testnet II announcements](https://docs.nexus.xyz) or Nexus X/Twitter).
- Request test $NEX tokens to your MetaMask address.

### 3. Deploy the Smart Contract
- Open [Remix IDE](https://rpc.nexus.xyz/http).
- Paste the contents of `contracts/NexusGame.sol` into a new file.
- Compile with Solidity ^0.8.0.
- Connect MetaMask to Nexus Testnet in Remix.
- Deploy the contract.
- Copy the deployed contract address.

### 4. Update the Game with Your Contract Address
- Open `public/game.js`.
- Find the line:
  ```js
  const contract = new web3.eth.Contract(contractABI, '0xYourDeployedContractAddress');
  ```
- Replace `'0xYourDeployedContractAddress'` with your actual contract address.

### 5. Run the Game Locally
- In your project directory:
  ```bash
  npm install
  npm start
  ```
- Open [http://localhost:3000](http://localhost:3000) in your browser.
- Connect MetaMask (set to Nexus Layer 1).
- Play and interact with the blockchain!

---

## Build with Ease on Nexus
- If you have built on Ethereum, you are ready to build on Nexus. It is fully EVM-compatible — use all your existing tools and code.
- Use Hardhat, Foundry, or Remix for development.
- Use standard libraries (ethers.js, web3.js, viem).
- Deploy Solidity contracts without modifications.

### Example Hardhat Network Config
```js
// hardhat.config.js
module.exports = {
  networks: {
    nexus: {
      url: "https://rpc.nexus.xyz/http",
      chainId: 393
    }
  }
}
```

### Deploy and Verify
```bash
npx hardhat deploy --network nexus
npx hardhat verify --network nexus <CONTRACT_ADDRESS>
```

---

## Features

- 3D exploration with procedurally generated levels
- Blockchain integration for node deployment and rewards
- Multiplayer mode for collaborative network building
- Community-driven level editor and sharing
- Educational elements teaching Nexus's Layer 1, zkVM, and decentralization

## Prerequisites

- Node.js (v16 or later)
- MetaMask browser extension
- Git

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/nexus-genesis-protocol.git
cd nexus-genesis-protocol
```

2. Install dependencies:
```bash
npm install
```

3. Configure MetaMask:
   - Add Nexus Testnet to MetaMask:
     - Network Name: Nexus Testnet II
     - RPC URL: [Check Nexus documentation]
     - Chain ID: [Check Nexus documentation]
     - Currency Symbol: $NEX
   - Request test tokens from the Nexus Testnet faucet

4. Deploy the smart contract:
   - Use Remix IDE or Hardhat to deploy `contracts/NexusGame.sol`
   - Copy the deployed contract address
   - Update the contract address in `public/game.js`

## Running the Game

1. Start the server:
```bash
npm start
```

2. Open your browser and navigate to:
```
http://localhost:3000
```

## Game Controls

- WASD: Move player
- Click: Place node
- Space: Interact with nodes
- E: Toggle editor mode
- C: Toggle Nexus Codex

## Smart Contract

The game uses a Solidity smart contract (`NexusGame.sol`) to:
- Track node deployments
- Manage player scores
- Handle puzzle verification
- Store network statistics

## Multiplayer

The game supports real-time multiplayer through Socket.IO:
- See other players in the game world
- Collaborate on network building
- Share node placements

## Level Editor

Create and share custom network layouts:
1. Toggle editor mode
2. Place nodes
3. Save the configuration
4. Share the JSON on X with #NexusPlayground

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Nexus Labs for the Playground Level 2 contest
- Three.js for 3D rendering
- Socket.IO for multiplayer functionality
- Web3.js for blockchain integration

## Contact

For questions or support, reach out on X with #NexusPlayground or open an issue on GitHub. 
