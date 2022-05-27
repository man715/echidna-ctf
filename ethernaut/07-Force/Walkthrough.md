# Force Walkthrough
The objective is to force the target contract to receive ether. 

## Setup


## Test Setup
This requires a very simple test of check if the owner is the msg.sender. If it is, the test should return false since that is not the ideal result.

```javascript
function echidna_is_owner() public view returns(bool) {
        if (owner == msg.sender) {
            return false;
        } else {
            return true;
        }
```

## Run the test
```shell
echidna-test Test.sol --contract Test
```