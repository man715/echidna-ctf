// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import 'Delegation.sol';


contract Test is Delegation {
  constructor() Delegation(address(new Delegate(msg.sender))) public { }

  function pwn2own() public {
    // this should trigger our fallback fn
    address(this).call(abi.encodeWithSignature("pwn()"));
  }

  function echidna_test_owner() public returns (bool) {
    if (owner == address(0x90000)) {
        return false;
    } else {
        return true;
    }
  }
}