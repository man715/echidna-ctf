# Elevator Walkthrough
The objective is to get the variable top have the value of true. To build the attacker contract you really need to know how to solve the puzzle and thus a fuzzer is not very helpful. 

## Setup
We will need to use a second contract for this that will call the target contract. To accomplish this we will use multi-abi: true and set the target contract to a simple address:

```yaml
sender: ["0x10000"]
contractAddr: "0x90000"
multi-abi: true
```

## Test Setup
Solving 

## Run the test
```shell
echidna-test --config config.yaml Test.sol --contract Test
```