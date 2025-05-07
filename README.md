# BitPortfolio - Decentralized Portfolio Management

[![Built on Stacks](https://img.shields.io/badge/Built_on-Stacks-5546ff)](https://www.stacks.co)

A Bitcoin-native portfolio management protocol for Stacks assets, enabling automated portfolio management with native Bitcoin security.

## Overview

BitPortfolio is a decentralized protocol built on the Stacks blockchain (Bitcoin L2) that empowers users to create, manage, and automatically rebalance token portfolios while leveraging Bitcoin's security model. The system combines DeFi portfolio management capabilities with Bitcoin compliance standards through Stacks' unique proof-of-transfer mechanism.

## Key Features

- 🛠️ **Portfolio Creation**  
  Create portfolios with up to 10 supported assets
- ⚖️ **Dynamic Allocation Management**  
  Set custom percentage allocations for each asset
- 🔄 **Automatic Rebalancing**  
  Threshold-based rebalancing executed on-chain
- 🔒 **Non-Custodial Ownership**  
  Complete user control over portfolio assets
- 📊 **Portfolio Analytics**  
  Built-in tools for performance tracking and historical analysis
- ⚡ **Bitcoin Settlement**  
  All transactions anchored to Bitcoin blocks for finality

## Technical Specification

### Smart Contract Details
- **Language:** Clarity 2.0
- **Blockchain:** Stacks L2 (Nakamoto Release)
- **Contract Address:** `SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.bitportfolio-v1`
- **Dependencies:** Stacks v3.5+, SIP-016 standard

## Getting Started

### Prerequisites
- [Hiro Wallet](https://www.hiro.so/wallet) for Stacks interactions
- Node.js v18+ & npm
- [Clarinet SDK](https://docs.hiro.so/clarinet) for local development

### Installation
```bash
git clone https://github.com/your-org/bit-portfolio.git
cd bit-portfolio
clarinet install
```

### Basic Usage
```bash
# Start local DevNet
clarinet integrate

# Run tests
npm test --costs
```

## Core Functionality

### Create Portfolio
```typescript
// Sample transaction call
create-portfolio(
  initial-tokens: [
    'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.token-a',
    'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.token-b'
  ],
  percentages: [4000, 6000] // 40% / 60% allocation
)
```

### Rebalance Portfolio
```bash
# Initiate rebalance (owner only)
clarinet contract call bitportfolio rebalance-portfolio --portfolio-id 1 --sender owner
```

## API Reference

### Public Functions

#### `create-portfolio`
- **Parameters:**
  - `initial-tokens`: List of token contracts (max 10)
  - `percentages`: Allocation percentages in basis points (sum 10,000)
- **Returns:** Portfolio ID (uint)

#### `rebalance-portfolio`
- **Parameters:** Portfolio ID
- **Triggers:** On-chain rebalancing to target allocations

#### `update-portfolio-allocation`
- **Parameters:**
  - Portfolio ID
  - Token ID (0-9)
  - New percentage (basis points)

## Error Handling

| Code      | Description                          |
|-----------|--------------------------------------|
| ERR-100   | Unauthorized operation               |
| ERR-101   | Invalid portfolio ID                 |
| ERR-102   | Insufficient token balance           |
| ERR-104   | Rebalance conditions not met         |
| ERR-107   | Exceeds max tokens per portfolio     |
| ERR-110   | Invalid token ID in portfolio        |

## Security Model

### Key Protections
1. **Ownership Verification**  
   All portfolio operations require owner signature validation
2. **Percentage Validation**  
   Allocation updates must maintain 100% total allocation
3. **Rebalance Cooldown**  
   Minimum 144 blocks (~24h) between rebalances
4. **Bitcoin Finality**  
   All transactions inherit Bitcoin's settlement guarantees

## Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/improvement`)
3. Commit changes (`git commit -am 'Add new feature'`)
4. Push to branch (`git push origin feature/improvement`)
5. Open Pull Request
