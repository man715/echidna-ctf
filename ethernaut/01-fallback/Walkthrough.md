# Fallback Walkthrough
Looking at the contract and the goal, we know we want to take ownership and drain the contract of all of its funds. 

## Setup
First, we should set up the config file so that the sender address is predictable and not randomized and make sure that the contract is supplied with some ether. 

config.yaml:
```yaml
sender: ["0x10000"]
balanceContract: 1000
```

Next, modify the target contract. Unfortunately, Echidna cannot reach `receive()` as a fallback function yet; however, it is being [worked on](https://github.com/crytic/echidna/pull/722). So to make sure we can reach all functions, we need to put `function` in front of the `recieve()` function definition. 

## Test Setup 
To test for this we can create a very simple test function.
```javascript
function echidna_owner_and_drain_funds() public view returns(bool) {
        if (owner == msg.sender) {
            return address(this).balance >= 1000;
        } else {
            return true;
        }
```

This function first checks to make sure the sender has owner ship of the contract then verifies if the contract still has the amount of ether we initially supplied it with.

## Run Test
Now run echidna from within the docker image.
```bash
echidna-test --config config.yaml Test.sol --contract Test
```