# Delegation Walkthrough
The goal is to claim ownership of the target contract. This contract uses `delegatecall` to run code from a library contract. 


# Setup 


# Test Setup
Echidna cannot identify delegate calls and therefore cannot call delegated functions automatically. To force this, you will need to create a wrapper for each function that you want to call. 

```js
function pwn2own() public {
    // this should trigger our fallback fn
    address(this).call(abi.encodeWithSignature("pwn()"));
  }
```