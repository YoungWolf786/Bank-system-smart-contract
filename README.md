# Bank System Smart Contract

This repository contains a smart contract for a basic banking system written in Solidity. The smart contract allows users to create accounts, deposit and withdraw Ether, and check their balances. This project is designed to be used with the Remix IDE.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)

## Overview

This smart contract simulates a simple bank system on the Ethereum blockchain. Users can:
- Create a new bank account.
- Deposit Ether into their account.
- Withdraw Ether from their account.
- Check the balance of their account.

## Features

- **Account Creation**: Users can create a new bank account.
- **Deposit**: Users can deposit Ether into their bank account.
- **Withdrawal**: Users can withdraw Ether from their bank account.
- **Balance Check**: Users can check their current balance.

## Prerequisites

- [Remix IDE](https://remix.ethereum.org/)
- Basic understanding of Solidity and smart contracts
- MetaMask or any other Ethereum wallet for interaction

## Installation

1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a new file in Remix and name it `BankSystem.sol`.
3. Copy and paste the following code into `BankSystem.sol`:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankSystem {
    mapping(address => uint256) private balances;
    
    event Deposit(address indexed account, uint256 amount);
    event Withdrawal(address indexed account, uint256 amount);

    // Function to deposit Ether into the bank
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    // Function to withdraw Ether from the bank
    function withdraw(uint256 amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }

    // Function to check the balance of the sender's account
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
```

4. Compile the contract using the Solidity compiler in Remix.
5. Deploy the contract using the Remix Deploy & Run Transactions module.

## Usage

1. **Deploy the Contract**: In the Remix IDE, after compiling the contract, deploy it to the Ethereum Virtual Machine (EVM) using the `Deploy` button in the "Deploy & Run Transactions" tab.
2. **Create an Account**: To create an account, simply interact with the contract using any of its functions. Your account is automatically created upon your first interaction.
3. **Deposit Ether**: Use the `deposit` function to send Ether to your account. Ensure you input the amount of Ether to deposit in the "Value" field before calling the function.
4. **Withdraw Ether**: Use the `withdraw` function to withdraw Ether from your account. Input the amount you wish to withdraw as a parameter.
5. **Check Balance**: Use the `getBalance` function to view the current balance of your account.

