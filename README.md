#  📚 Library Management  Smart Contract

## Project Overview
`LibraryManagement` is a decentralized smart contract built with Solidity for managing books on-chain. The contract allows a library owner to register books while enabling users to toggle the availability status of books transparently on the blockchain. </br>
The system demonstrates how blockchain technology can be used for digital record management, ownership control, transparency, and event-driven tracking in a decentralized environment. </br>

****Main Objective:**** </br>
The primary goal of this smart contract is to: </br>
* Store library books securely on-chain.
* Prevent duplicate book registrations.
* Allow availability tracking of books.
* Demonstrate access control using Solidity modifiers.
* Emit blockchain events for transparency and monitoring.

 
## 📌 Features
* ****Duplicate Prevention:**** The contract checks whether a book ID already exists before adding a new book.
* ****Owner-Only Book Registration:**** Only the contract owner can add new books into the library system using the `addBook()` function.
* ****Book Availability Toggle:**** Any user can update a book’s availability status
* ****On-Chain Storage:****
* ****Event Emission:****
* ****Custom Errors:****

## 🧠 Key Concepts Applied

## 📂 Project Structure (Files)

## 🌐Technology Stack (Technologies Used)
* ****[Solidity](https://www.soliditylang.org/)**** -  The programming language for writing the Smart contracts.
* ****[Remix IDE](https://remix.ethereum.org/)**** - used it to write, and deploy the smart contract directly in the browser first. A fastest way to get started, acting as a "no-setup" workshop for smart contract development.
* ****[Foundry(forge, cast, anvil)](https://www.getfoundry.sh/)****  - Development framework and testing suite.
* ****[Visual Studio Code](https://code.visualstudio.com/)**** - Install this IDE only if you are using foundry development kit  rather than "Remix IDE" which is for quick prototying.


## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of (Some include):

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).

## Documentation

https://book.getfoundry.sh/

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

## Author
Built with ❤️ by [@legendarycode3](https://github.com/legendarycode3/)  </br>
Part of my  `60 Days of Solidity Challenge`

##  If you find this project helpful,  link back to this repository. 
`I Appreciate`
