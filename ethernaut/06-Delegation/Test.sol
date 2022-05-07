// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import 'Delegation.sol';

contract Test is Delegation {
    constructor() Delegation( address(new Delegate(address(0x10000)))) public {}
    
    function pwn2own() public {
    // this should trigger our fallback fn
    address(this).call(abi.encodeWithSignature("pwn()"));
  }

    function echidna_is_owner() public view returns(bool) {
        return owner != address(msg.sender);
    }
}