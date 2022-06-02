// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import 'Preservation.sol';

contract Test is Preservation {
    Library library1 = new Library();
    Library library2 = new Library();
    constructor() Preservation(library1, library2){}
    
}