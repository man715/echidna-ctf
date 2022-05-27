// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Vault {
  bool public locked;
  bytes32 private password;

  constructor() public {
    locked = true;
    password = 'H25Uir3narCNqT5Z@^V#@3BDJhv&is2';
  }

  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
}