// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Fallout.sol';

contract Test is Fallout {
    function echidna_is_owner() public view returns(bool) {
        if (owner == msg.sender) {
            return false;
        } else {
            return true;
        }
    }
}