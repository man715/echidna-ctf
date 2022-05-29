// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import 'GatekeeperOne.sol';

contract Test is GatekeeperOne {
    function echidna_is_entrant() public returns (bool) {
        if (entrant != msg.sender) {
            return true;
        } else {
            return false;
        }
    }
}