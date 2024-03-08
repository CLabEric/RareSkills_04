// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.0;

import "./mintable.sol";

/// @dev Run the template with
///      ```
///      solc-select use 0.8.0
///      echidna program-analysis/echidna/exercises/exercise3/template.sol --contract TestToken
///      ```
contract TestToken is MintableToken {
    address echidna = msg.sender;

    constructor() MintableToken(10000) {
        owner = echidna;
    }

    function echidna_test_balance() public view returns (bool) {
        return balances[msg.sender] <= 10000;
    }
}


// - Create a scenario where echidna (tx.origin) becomes the owner of the contract at construction, and totalMintable is set to 10,000. 
// Remember that Echidna needs a constructor without arguments.
// - Add a property to check if echidna can mint more than 10,000 tokens.
// - Once Echidna finds the bug, fix the issue, and re-try your property with Echidna.