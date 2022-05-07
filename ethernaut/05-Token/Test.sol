// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Token.sol';

contract Test is Token {

    constructor() Token(20000000000000000000) public {
        balances[address(0x10000)] = 20;
    }
    function echidna_balance_higher_than_20() public view returns(bool) {
        return balances[msg.sender] <= 20;
    }
}