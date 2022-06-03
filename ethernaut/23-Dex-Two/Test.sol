pragma solidity ^0.6.0;

import "DexTwo.sol";

contract Test is DexTwo {

    constructor() DexTwo() public {
        SwappableTokenTwo _token1 = new SwappableTokenTwo(address(this), "Token1", "t1", 100 );
        SwappableTokenTwo _token2 = new SwappableTokenTwo(address(this), "Token2", "t2", 100 );
        _token1.transfer(address(0x10000), 10);
        _token2.transfer(address(0x10000), 10);
        token1 = address(_token1);
        token2 = address(_token2);
    }

    function swap1to2() public {
        uint256 _amount = SwappableTokenTwo(token1).balanceOf(address(0x10000));
        swap(token2, token1, _amount);
    }

    function swap2to1() public {
        uint256 _amount = SwappableTokenTwo(token2).balanceOf(address(0x10000));
        swap(token2, token1, _amount);
    }

    function echidna_test_dex_balance_token1() public returns (bool) {
        return (SwappableTokenTwo(token1).balanceOf(address(this)) > 0);
    }

    function echidna_test_dex_balance_token2() public returns (bool) {
        return (SwappableTokenTwo(token2).balanceOf(address(this)) > 0);
    }

    function echidna_test_attacker_balance_token1() public returns (bool) {
        return (SwappableTokenTwo(token1).balanceOf(address(0x10000)) > 0);
    }

}