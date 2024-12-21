// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FinancialGame {
    address public owner;
    uint256 public income;
    uint256 public expenses;
    uint256 public savings;
    uint256 public budget;
    uint256 public balance;

    // Modifier to ensure only the owner can interact with the contract
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // Constructor to initialize the game
    constructor(uint256 _income) {
        owner = msg.sender;
        income = _income;
        balance = income;
        expenses = 0;
        savings = 0;
        budget = _income;
    }

    // Set the monthly budget
    function setBudget(uint256 _budget) public onlyOwner {
        require(_budget <= income, "Budget cannot exceed income");
        budget = _budget;
    }

    // Add an expense
    function addExpense(uint256 amount) public onlyOwner {
        require(amount + expenses <= budget, "Expense exceeds budget");
        expenses += amount;
        balance -= amount;
    }

    // Save money
    function saveMoney(uint256 amount) public onlyOwner {
        require(amount <= balance, "Not enough balance to save");
        savings += amount;
        balance -= amount;
    }

    // Get the current balance
    function getBalance() public view returns (uint256) {
        return balance;
    }

    // Get the total savings
    function getSavings() public view returns (uint256) {
        return savings;
    }

    // Get the total expenses
    function getExpenses() public view returns (uint256) {
        return expenses;
    }
}

