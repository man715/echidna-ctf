// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Telephone.sol';

contract RingRing {
  // Point to the target contract.
  Test phone = Test(0x4242);
  
  function pwn() public {
    // Change the owner of the target contract
    phone.changeOwner(address(0x10000));
  }
}

contract Test is Telephone {
    RingRing ring;
  constructor() Telephone() public payable {
    // Instantiate a new RingRing contract that will change the owner of target contract.
    ring = new RingRing();
  }

  // At some point this function will get called by echidna changing the owner of the Test contract.
  function callPwn() public {
      ring.pwn();
  }

    function echidna_test_origin() public returns (bool) {
        if (tx.origin == owner) {
            return false;
        } else {
            return true;
        }
    }    
}