# Re-entrancy Walkthrough
Currently echidna is not set up in a way to blindly test for re-entrancy attacks as far as I can tell. 
If you already have a suspicion of an area where you can reenter a target contract, you can build a contract and a test around that suspicion. 

In this challenge we suspect that there is a re-entrancy attck in the `withdraw`  function. 

Re-entrancy can be simple, as in this case, or much more complex. While in this challenge you are re-entering the same function that multiple times, there may be contracts vulnerable to re-entering at different points. This capability would be a good feature for consideration although the solution my be complex. 

## Setup
To setup the contract, we will want to explicitly set a sender and 