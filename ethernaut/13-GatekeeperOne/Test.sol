// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import 'GatekeeperOne.sol';

contract Test {
    GatekeeperOne target;
    constructor() public {
        target = new GatekeeperOne();
    }

    function start(bytes8 _gateKey) public {
        target.enter(_gateKey);
    }

    function echidna_is_entrant() public returns (bool) {
        if (entrant != msg.sender) {
            return true;
        } else {
            return false;
        }
    }
}