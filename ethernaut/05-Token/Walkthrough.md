# Token Walkthrough
The objective is to get more tokens that what the account is supposed to have. The account starts off with 20 tokens.

# Setup
To make sure the fuzzer only uses one sender address, we will set the psender in the config.

```yaml
psender: "0x10000"
```


# Test Setup
This test requires a little more thought and setup. We have to supply an address with 20 tokens and supply the Token contract with a total amount of tokens.

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Token.sol';

contract Test is Token {

    constructor() Token(50) public {
        balances[address(0x10000)] = 20;
    }
    function echidna_balance_higher_than_20() public view returns(bool) {
        return balances[msg.sender] <= 20;
    }
}
```