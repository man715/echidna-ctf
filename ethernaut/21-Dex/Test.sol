pragma solidity ^0.6.0;

import "Dex.sol";

contract Test is Dex {

    constructor() Dex() public {
        SwappableToken _token1 = new SwappableToken(address(this), "Token1", "t1", 100 );
        SwappableToken _token2 = new SwappableToken(address(this), "Token2", "t2", 100 );
        _token1.transfer(address(0x10000), 10);
        _token2.transfer(address(0x10000), 10);
        token1 = address(_token1);
        token2 = address(_token2);
    }

    function echidna_test_dex_balance_token1() public returns (bool) {
        return (SwappableToken(token1).balanceOf(address(this)) > 1);
    }

    function echidna_test_dex_balance_token2() public returns (bool) {
        return (SwappableToken(token2).balanceOf(address(this)) > 1);
    }

    function echidna_test_attacker_balance_token1() public returns (bool) {
        return (SwappableToken(token1).balanceOf(address(0x10000)) > 1);
    }

}