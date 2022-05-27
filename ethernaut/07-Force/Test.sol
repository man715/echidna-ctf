// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import 'Force.sol';

contract Test {
  Force target;

  constructor() public payable {
    target = new Force();
  }

  function destroy() public {
    selfdestruct(payable(address(target)));
  }

  function echidna_test_balance() public returns (bool) {
    return address(target).balance == 0;
  }

  function echidna_test_balance2() public returns (bool) {
    return address(this) == address(0x90000);
  }
}