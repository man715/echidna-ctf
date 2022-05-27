// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import 'Vault.sol';

contract Test is Vault {
    function echidna_test_lock() public returns (bool) {
        return locked;
    }
}