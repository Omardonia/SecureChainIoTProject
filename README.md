🔐 IoT Cold Chain Security Using Blockchain
Secure Authentication & Trusted Data Recording with Ethereum Smart Contracts
📌 Overview

This project provides a blockchain-based solution for securing temperature data in IoT Cold Chain Logistics. Traditional centralized systems allow administrators or attackers to modify logs, leading to loss of trust and potential spoilage concealment.
Our Ethereum smart contract guarantees authentication, immutability, and transparency for all temperature records.

🚀 Features

Secure Authentication – Only authorized IoT sensors can record data.

Immutable Logs – All temperature records are permanently stored on the blockchain.

Tamper-Proof Architecture – Prevents impersonation, modification, and replay attacks.

Structured Data Records – Stores temperature, timestamp, location, and device ID.

Event Logging – Emits events for authorization and new data entries.

🏗️ System Architecture
Entities

Admin – Deploys contract and manages sensor authorization.

IoT Sensor – Sends temperature logs using recordData().

Auditor – Queries blockchain to view complete, transparent history.

Core Components

Smart contract: SecureIoTLog.sol

Mapping-based authorization

Append-only record array

On-chain data with no modification functions

🔒 Security

1. Impersonation Attack Prevention
Unauthorized devices cannot call recordData() due to strict authorization checks.

2. Modification Attack Prevention
No update/delete function exists — blockchain immutability ensures logs cannot be altered.

3. Replay Attack Protection
Ethereum transaction nonces and timestamps eliminate duplicate data injection.

⚙️ Development & Tools

Language: Solidity 0.8.x

IDE: Remix

Network: Remix VM / Ethereum Testnet

Testing: Multiple accounts to simulate Admin, Sensors, and Attackers

📊 Performance
Operation	Gas Cost (Approx.)
Contract Deployment	~1,100,000
authorizeDevice()	~45,200
recordData()	~72,100

Latency is negligible on Remix VM and ~12–15 seconds per block on Ethereum Mainnet.

📈 Future Enhancements

Integrate IPFS for off-chain media storage

Add a Web3.js/React dashboard

Migrate to Layer-2 networks for lower gas costs

🧑‍💻 Authors

Abdelaziz El-Sheikh

Marwan Ayman

Omar Donia
Arab Academy for Science, Technology & Maritime Transport
