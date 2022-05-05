# Fallout Walkthrough
Our goal for this challenge is to become the owner of the contract.

## Setup
This contract does not require any setup.

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