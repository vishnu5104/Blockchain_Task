# Blockchain_Task

## a. Transfer Tokens to the TokenSale Contract:

1. Expand the deployed **MyToken** contract.
2. Use the `transfer` function to send tokens to the **TokenSale** contract address.
3. Enter the **TokenSale contract address** and the amount of tokens (e.g., `1000000000000000000000` for 1000 tokens).

---

## b. Buy Tokens:

1. Expand the deployed **TokenSale** contract.
2. Use the `buyTokens` function.
3. In the **Value** field, enter the amount of ETH you want to send (e.g., `1 ETH`).
4. Click **Transact** to purchase tokens.

---

## c. Check Purchase Details:

1. Use the `purchases` function with your address to view your purchase details.

---

## d. Release Tokens (After 365 days):

1. After **365 days** it release the token
2. Use the `releaseTokens` function to claim your purchased tokens.

---

[Remix Mytoken Contract](https://remix.ethereum.org/#url=https://raw.githubusercontent.com/vishnu5104/Blockchain_Task/refs/heads/main/contracts/MyToken.sol&lang=en&optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.26+commit.8a97fa7a.js)

[Remix TokenSale Contract](https://remix.ethereum.org/#url=https://raw.githubusercontent.com/vishnu5104/Blockchain_Task/refs/heads/main/contracts/TokenSale.sol&lang=en&optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.26+commit.8a97fa7a.js)
