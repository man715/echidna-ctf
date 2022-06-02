# Naught Coin Walkthrough
The objective is to get the variable top have the value of true. To build the attacker contract you really need to know how to solve the puzzle and thus a fuzzer is not very helpful. 

## Setup

We will want to make sure the sender is only coming from one address. 

```yaml
sender: ["0x10000"]
```

## Test Setup
This is a simple setup for the test contract. The contract being tested needs to have one parameter passed to it which is the address of the player. Since we are going to be stating a single address for this we can set a constant variable as the player's address which matches the address given in the config.yaml file. 

## Run the test
```shell
echidna-test --config config.yaml Test.sol --contract Test
```