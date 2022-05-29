// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import 'GatekeeperTwo.sol';

contract Attacker {
    constructor(GatekeeperTwo _target) public {
        _target.enter
    }
}

contract Test {
    GatekeeperTwo target;
    constructor() public {
        target = new GatekeeperOne();
    }

    function start(bytes8 _gateKey) public {
        New Attacker();
    }

    function echidna_is_entrant() public returns (bool) {
        if (entrant != msg.sender) {
            return true;
        } else {
            return false;
        }
    }
}