// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenSale is ReentrancyGuard, Ownable {
    IERC20 public token;
    uint256 public constant RATE = 100; 
    uint256 public constant RELEASE_DELAY = 365 minutes;

    struct Purchase {
        uint256 amount;
        uint256 releaseTime;
    }

    mapping(address => Purchase) public purchases;

    event TokensPurchased(address indexed buyer, uint256 amount, uint256 releaseTime);
    event TokensReleased(address indexed buyer, uint256 amount);

    constructor(address _tokenAddress) Ownable(msg.sender) {
        token = IERC20(_tokenAddress);
    }

    function buyTokens() public payable nonReentrant {
        require(msg.value > 0, "Must send ETH to buy tokens");

        uint256 tokenAmount = msg.value * RATE;
        require(token.balanceOf(address(this)) >= tokenAmount, "Not enough tokens in the contract");

        purchases[msg.sender] = Purchase({
            amount: tokenAmount,
            releaseTime: block.timestamp + RELEASE_DELAY
        });

        emit TokensPurchased(msg.sender, tokenAmount, purchases[msg.sender].releaseTime);
    }

    function releaseTokens() public nonReentrant {
        Purchase storage purchase = purchases[msg.sender];
        require(purchase.amount > 0, "No tokens to release");
        require(block.timestamp >= purchase.releaseTime, "Tokens are not ready for release yet");

        uint256 amount = purchase.amount;
        purchase.amount = 0;

        require(token.transfer(msg.sender, amount), "Token transfer failed");

        emit TokensReleased(msg.sender, amount);
    }

    function withdrawEth() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No ETH to withdraw");
        payable(owner()).transfer(balance);
    }

    function withdrawUnsoldTokens() public onlyOwner {
        uint256 balance = token.balanceOf(address(this));
        require(balance > 0, "No tokens to withdraw");
        require(token.transfer(owner(), balance), "Token transfer failed");
    }
}