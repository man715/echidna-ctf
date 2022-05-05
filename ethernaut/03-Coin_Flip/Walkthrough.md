# Coin Flip Walkthrough
The objective of this is to guess the flip correctly 10 times in a predictable manner. I'm not sure that this fuzzer is really able to help us guess the flip in a predictable manner as it is fesible that the fuzzer can guess the input correctly 10 times in a row. To successfully and predictably break the contract, we should be able to not only guess 10 consecutive times but even up to 100 times. When I run the test for greater than 10 times, the fuzzer is able to make the contract fail. However, test it for 100 times it does not cause a fail. 

# Setup
This does not require any setup.

# Test Setup

```javascript
function echidna_test_flip() public view returns(bool) {
        return consecutiveWins <= 10;
    }
```

I tested with the consecutiveWins at 10 and 100.