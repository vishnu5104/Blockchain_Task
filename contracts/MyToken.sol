// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VSTOKEN is ERC20,Ownable {
    uint256 private constant TOTAL_SUPPLY = 21_000_000 * 10**18; 

    constructor() ERC20("VSTOKEN", "VST") Ownable(msg.sender) {
        _mint(msg.sender, TOTAL_SUPPLY);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}