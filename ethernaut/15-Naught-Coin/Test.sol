pragma solidity ^0.6.0;

import 'Naught-Coin.sol';

contract Test is NaughtCoin {
    address constant sender = address(0x10000);

    constructor() NaughtCoin(sender) public {}

    function echidna_test_player_balance() public returns (bool) {
        return balanceOf(player) == INITIAL_SUPPLY;
    }
}