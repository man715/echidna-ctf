# Delegation Walkthrough
The goal is to claim ownership of the target contract. This contract uses `delegatecall` to run code from a library contract. 

I am not able to get this contract to break the invariant.

# Setup 
To only use one sender we will setup the config to make use of `psender`.

# Test Setup
