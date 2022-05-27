# Coin Flip Walkthrough
The objective of this is to guess the flip correctly 10 times in a predictable manner. I'm not sure that this fuzzer is really able to help us guess the flip in a predictable manner as it is feasible that the fuzzer can guess the input correctly 10 times in a row. 

To successfully and predictably break the contract, we should be able to not only guess 10 consecutive times but even 100 or more times. When I run the test for greater than 10 times, the fuzzer is able to make the contract fail using multiple senders. However, test it for 100 times or more. with using `psender` or `sender` the invariant does not fail. 

The fuzzer does potentially lead you down the right path for solving this issue as it does cause the invariant to fail on 10 consecutive tries with time/block delays. However, in my testing it does not help discern what delay will give consistent predictable results. 

One thing to note is that the solution to this problem is not using a delay but instead to use the block hash to determine if the coin flip result will be heads or tails. 

# Setup
This does not require any setup.

# Test Setup

```javascript
function echidna_test_flip() public view returns(bool) {
        return consecutiveWins <= 10;
    }
```

I tested with the consecutiveWins at 10, 50, and 100.

## Run Test
```shell
echidna-test --config config.yaml Test.sol --contract Test
```