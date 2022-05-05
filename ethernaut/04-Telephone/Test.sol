// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Telephone.sol';

contract RingRing {
  Test phone = Test(0x4242);

  constructor() public payable {
      phone.changeOwner(address(0x20000));
  }

  function pwn() public {
    phone.changeOwner(address(0x30000));
  }
}

contract Test is Telephone {
  constructor() Telephone() public payable {
    // hint echidna
    new RingRing();
  }

  function echidna_test_owner() public returns (bool) {
    if (owner == msg.sender) {
        return true;
    } else {
        return true;
    }
  }
}