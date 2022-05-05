# echidna-ctf
This repository is inspired by elopez's Ethernaut CTF with Echidna which can be found [here](https://github.com/elopez/echidna-ethernaut).  Additionally, the goal is to help the issue [crytic/echidna#443](https://github.com/crytic/echidna/issues/433). 

Starting with Ethernaut, I am going to attempt to use Echidna to identify and solve CTF challenges. My goal is to learn more about fuzzing, Solidity, and if possible, make suggestions for improvements.

Each attempt will have the CTF contract(s), the test contract(s), and a writeup explaining why the tests were set up the way they were. 

# Ethernaut

| \#  | Name             | Solved | Echidna  | Filed Issue |
| --- | ---------------- |:------:|:--------:| ----------- |
| 01  | Fallback         |  Yes   | :muscle: |             |
| 02  | Fallout          |        |          |             |
| 03  | Coin Flip        |        |          |             |
| 04  | Telephone        |        |          |             |
| 05  | Token            |        |          |             |
| 06  | Delegation       |        |          |             |
| 07  | Force            |        |          |             |
| 08  | Vault            |        |          |             |
| 09  | King             |        |          |             |
| 10  | Re-entrancy      |        |          |             |
| 11  | Elevator         |        |          |             |
| 12  | Privacy          |        |          |             |
| 13  | Gatekeeper One   |        |          |             |
| 14  | Gatekeeper Two   |        |          |             |
| 15  | Naught Coin      |        |          |             |
| 16  | Preservation     |        |          |             |
| 17  | Recovery         |        |          |             |
| 18  | MagicNumber      |        |          |             |
| 19  | Alien Codex      |        |          |             |
| 20  | Denial           |        |          |             |
| 21  | Shop             |        |          |             |
| 22  | Dex              |        |          |             |
| 23  | Dex Two          |        |          |             |
| 24  | Puzzle Wallet    |        |          |             |
| 25  | Motorbike        |        |          |             |
| 26  | DoubleEntryPoint |        |          |             |

Echidna reference:
 * :muscle:: Echidna breaks the invariant by itself or mostly by itself
 * :mag:: Echidna merely verifies some given code breaks the provided invariant

# Setup 
I will be using Trail of Bits' Docier image eth-security-toolbox.

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

