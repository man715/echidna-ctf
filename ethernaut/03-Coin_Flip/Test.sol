// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './CoinFlip.sol';

contract Test is CoinFlip {
    function echidna_test_flip() public view returns(bool) {
        return consecutiveWins <= 100;
    }
}