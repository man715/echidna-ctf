# Elevator Walkthrough
The objective is to get the variable top have the value of true. 

## Setup
We will need to use a second contract for this that will call the target contract. To accomplish this we will use multi-abi: true and set the target contract to a simple address:

```yaml
sender: ["0x10000"]
contractAddr: "0x90000"
```

## Test Setup


## Run the test
```shell
echidna-test --config config.yaml Test.sol --contract Test
```