pragma solidity ^0.6.0;

import "Dex.sol";

contract Test is Dex {
    SwappableToken token1;
    SwappableToken token2;

    constructor() Dex() {
        token1 = new SwappableToken(address(this), "Token1", "t1", 90 );
        token2 = new SwappableToken(address(this), "Token2", "t2", 90 );
        token1.mint(address(0x10000), 10);
        token2.mint(address(0x10000), 10);
    }

    function echidna_test_dex_balance() public returns (bool) {
        return token1.balanceOf(address(this)) > 1 && token2.balanceOf(address(this)) > 1;
    }

}