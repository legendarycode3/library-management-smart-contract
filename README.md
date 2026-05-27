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
* ****Book Availability Toggle:**** Any user can update a book’s availability status using the `toggleBookAvailable()` function.
* ****On-Chain Storage:**** All books are permanently stored on the blockchain through mappings.
* ****Event Emission:**** These events `BookRegistered` and `BookStatusToggled` improve transparency and offchain interaction.
* ****Custom Errors:**** Gas-efficient custom Solidity errors are used instead of long revert strings.

## 🧠 Key Concepts Applied
* ****Struct:**** The contract uses a `struct` to organize and store book information efficiently.</br>
  Purpose: Structs group multiple related variables into a single custom data type.
* ****Mapping:**** The contract uses mappings for efficient book storage and retrieval. </br>
  Purpose: Mappings store key-value pairs on-chain.
* ****Modifier:**** The contract applies access control using modifiers.
  Purpose: Modifiers restrict function execution conditions.
* ****Constructor:**** The constructor initializes the contract during deployment.
* ****Event:**** The contract emits blockchain events for transparency.
  Purpose: Events log important contract activities on-chain.
* ****Custom Error:**** The Custom error provided a more gas-efficient error handling. Consumes less gas than revert strings.
* ****Enums:**** Implemented Enum , which Improves readability and state management. Represents book states.
  Purpose: Enums define a fixed set of constant values.
* ****Storage References:**** Storage Reference like this `Book storage book = s_bookRegistry[_bookId];` ,modify blockchain state variables. Its helps to avoids unnecessary memory copying.

## 📂 Project Structure (Files)
* ****`LibraryManagement.sol`**** Main smart contract file containing the complete Library Management system logic.</br>
  It includes:
    * Book registration system.
* 

## 🌐Technology Stack (Technologies Used)
* ****[Solidity](https://www.soliditylang.org/)**** -  The programming language for writing the Smart contracts.
* ****[Remix IDE](https://remix.ethereum.org/)**** - used it to write, and deploy the smart contract directly in the browser first. A fastest way to get started, acting as a "no-setup" workshop for smart contract development.
* ****[Foundry(forge, cast, anvil)](https://www.getfoundry.sh/)****  - Development framework and testing suite.
* ****[Visual Studio Code](https://code.visualstudio.com/)**** - Install this IDE only if you are using foundry development kit  rather than "Remix IDE" which is for quick prototying.

## 📋Contract Details
### Functions:
* ****`addBook()`****: Adds a new book into the library. Owner-only access. The function Prevents duplicate IDs, Stores book data and Emits registration event.
* ****`toggleBookAvailable()`****: Changes a book’s availability status. The function Verifies book existence, Toggles boolean availability and Emits status update event.

### Variables:
* ****`s_booksCount`****: Tracks total books added.
* ****`i_owner`****:  Immutable contract owner.
* ****`s_bookState`****: Stores enum state.
* ****`s_bookRegistry`****: Stores all books.

## Why This Matters (Library Managment Smart Contract)
Library Managment Smart Contracts are crucial in web3 blockchain systems for:
1. ****Decentralized Record Management:**** Traditional library systems rely on centralized databases that can be manipulated, hacked, or shut down. A blockchain-based library system stores records on-chain, making them: `Decentralized`, `Transparent`, `Tamper-resistant`. This removes dependence on a single authority.
2. ****Transparency & Trust:**** Every action performed in the smart contract is publicly verifiable. Because blockchain data is immutable, users can trust that records cannot be secretly altered.
3. ****Interoperability:**** Allows different decentralized libraries and educational platforms to share catalogs and research materials seamlessly,  operating on uniform on-chain rules.
4. ****Data Integrity:**** Smart contracts prevent unauthorized modifications and duplicate records. This improves the reliability of the system.
5. ****Real-Time State Synchronization:**** All blockchain participants see the same data instantly.


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
