// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Fallback.sol';

contract Test is Fallback {
    function echidna_owner_and_drain_funds() public view returns(bool) {
        if (owner == msg.sender) {
            return address(this).balance >= 1000;
        } else {
            return true;
        }
    }
}