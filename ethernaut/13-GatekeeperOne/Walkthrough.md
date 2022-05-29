# GatekeeperOne Walkthrough
The objective is to get the entrant to be the same as the msg.sender. 

This is another challenge that is not best suited for a fuzzer. For Echidna to break this contract it would need to randomize the amount of gas being sent. I think that if Echidna did randomize the gas sent, it would eventually solve this challenge. 

## Setup
We will make sure the sender is from one address only.

```yaml
sender: ["0x10000"]
```

## Test Setup


## Run the test
```shell
echidna-test --config config.yaml Test.sol --contract Test
```