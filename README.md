# echidna-ctf
This repository is inspired by elopez's Ethernaut CTF with Echidna which can be found [here](https://github.com/elopez/echidna-ethernaut).  Additionally, the goal is to help the issue [crytic/echidna#443](https://github.com/crytic/echidna/issues/433). 

Starting with Ethernaut, I am going to attempt to use Echidna to identify and solve CTF challenges. My goal is to learn more about fuzzing, Solidity, and if possible, make suggestions for improvements.

Each attempt will have the CTF contract(s), the test contract(s), and a writeup explaining why the tests were set up the way they were. 

# Ethernaut

| \#  | Name             | Solved with Echidna |     Echidna     | Filed Issue                                  | Notes                                                                                                               |
| --- | ---------------- |:-------------------:|:---------------:| -------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| 01  | Fallback         |         Yes         |    :muscle:     |                                              |                                                                                                                     |
| 02  | Fallout          |         Yes         |    :muscle:     |                                              |                                                                                                                     |
| 03  | Coin Flip        |         No          | :no_entry_sign: |                                              | The fuzzer does potentially lead you down the right path for solving this issue as it does cause the invariant to fail on 10 consecutive tries with time/block delays. However, in my testing it does not help discern what delay will give consistent predictable results.                                                                                                                     |
| 04  | Telephone        |         Yes         |      :mag:      |                                              |                                                                                                                     |
| 05  | Token            |         Yes         |    :muscle:     |                                              |                                                                                                                     |
| 06  | Delegation       |         Yes         |      :mag:      | https://github.com/crytic/echidna/issues/764 |                                                                                                                     |
| 07  | Force            |         N/A         | :no_entry_sign: |                                              |                                                                                                                     |
| 08  | Vault            |         N/A         | :no_entry_sign: |                                              |                                                                                                                     |
| 09  | King             |         N/A         | :no_entry_sign: |                                              |                                                                                                                     |
| 10  | Re-entrancy      |         Yes         |      :mag:      |                                              |                                                                                                                     |
| 11  | Elevator         |         N/A         | :no_entry_sign: |                                              |                                                                                                                     |
| 12  | Privacy          |         N/A         | :no_entry_sign: |                                              |                                                                                                                     |
| 13  | Gatekeeper One   |         No          | :no_entry_sign: |                                              | For Echidna to break this contract, it would need to randomize the amount of gas being sent.                        |
| 14  | Gatekeeper Two   |         No          | :no_entry_sign: |                                              | For Echidna to be able to solve this challenge, it would have to be able to randomize the inputs for a constructor. |
| 15  | Naught Coin      |                     |                 |                                              |                                                                                                                     |
| 16  | Preservation     |                     |                 |                                              |                                                                                                                     |
| 17  | Recovery         |                     |                 |                                              |                                                                                                                     |
| 18  | MagicNumber      |                     |                 |                                              |                                                                                                                     |
| 19  | Alien Codex      |                     |                 |                                              |                                                                                                                     |
| 20  | Denial           |                     |                 |                                              |                                                                                                                     |
| 21  | Shop             |                     |                 |                                              |                                                                                                                     |
| 22  | Dex              |                     |                 |                                              |                                                                                                                     |
| 23  | Dex Two          |                     |                 |                                              |                                                                                                                     |
| 24  | Puzzle Wallet    |                     |                 |                                              |                                                                                                                     |
| 25  | Motorbike        |                     |                 |                                              |                                                                                                                     |
| 26  | DoubleEntryPoint |                     |                 |                                              |                                                                                                                     |

Echidna reference:
 * :muscle:: Echidna breaks the invariant by itself or mostly by itself. The echidna-specific code needed contains an echidna property to represent the CTF "win" condition, and Echidna finds the (series of) calls that break the contract via fuzzing. Example: Fallout test contract; it extends the CTF contract and only adds a single echidna property.
 * :mag:: Echidna merely verifies that some given code breaks the provided invariant. The code needed contains an echidna property as well as extra functions and any auxiliary contracts required to execute the attack to solve the exercise. Example: Gatekeeper Two test contract; it has helper contracts and an extra function to trigger the attack, as well as an echidna property that represents the CTF "win" condition. When echidna triggers the attack and then runs the property, it will confirm that the attack was successful.
 * :no_entry_sign:: Echidna could not conclusively suggest an issue or provide a solution to the challenge



# Setup 
I will be using Trail of Bits' Docker image eth-security-toolbox.

```bash
docker run -it --rm -v $PWD:/code trailofbits/eth-security-toolbox
```

I will be using version 3.0.0 of the Open Zeppelin contracts. The contracts will be put in the directory that I will be running the docker container from. This is so I can use the full path to the contracts which will be `/code/@openzeppelin/<contract_path_and_name>`

```bash
mkdir node_modules
npm install @openzeppelin/contracts@3.0.0
mv node_modules/@openzeppelin .
rm -rf node_modules
```

# Echidna Command
The command I run to get the output here is as follows:
```bash
echidna-test Test.sol --config config.yaml --contract Test --format text | tee echidna-text-run.log && rm -rf crytic-export
```

I'm not sure if there is a better way to clean up the crytic-export folder or not. 