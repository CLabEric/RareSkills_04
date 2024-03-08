## SanctionCoin.sol

### true positive?

SanctionCoin.transfer(address,uint256).owner (src/SanctionCoin.sol#44) shadows: - Ownable.owner() (lib/openzeppelin-contracts/contracts/access/Ownable.sol#56-58) (function)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#local-variable-shadowing

### True positive

Different versions of Solidity are used

### False positive

Dead code. Happens inside OZ imported contracts

## CurveCoin.sol

### True positive

Different versions of Solidity are used

### False positive

Dead code. Happens inside OZ imported contracts

### True positive

Incorrect versions of Solidity. Should lock versions in

### False positive

Low level call in CurveCoin.buyBack(uint256) (src/CurveCoin.sol#31-39): - (sent) = address(msg.sender).call{value: buyBackAmount \* 1000000000000000000}() (src/CurveCoin.sol#37)
Ok in this case, success is checked

### False positive

Param with underscore is not in mixedCase. Ok because '\_amount' just one word

## Escrow.sol

### False positive

Dangerous strict equality. Ok for boolean

### False positive

Uses timestamp for comparisons
Dangerous comparisons: - require(bool,string)(d.seller == msg.sender,you are not the seller) (src/Escrow.sol#41) - require(bool,string)(d.paid == false,already paid) (src/Escrow.sol#42) - require(bool,string)(block.timestamp - d.timeStamp >= 259200,Has not been 3 days) (src/Escrow.sol#43)
Ok in this case. Acceptable variance for time bases calculations

### False positive

Uses assembly. This happens in imported contracts, not my own code

### True positive

compares to a boolean constant: Can just use the boolean value
'require(bool,string)(d.paid == false,already paid) (src/Escrow.sol#42)'

### True positive

Different versions of Solidity are used:

### True AND False positive

Dead code. Happens inside OZ imported contracts so ok but also forgot to remove a 'console.log()'

### True positive

Incorrect versions of Solidity. Should lock versions in

### False positive

Low level call. Only happening in imported OZ contracts

### False positive

Param with underscore is not in mixedCase. Ok because '\_amount', '\_token', etc... are just one word

## GodCoin.sol

### True positive

GodCoin.transfer(address,uint256).owner (src/GodCoin.sol#32) shadows: - Ownable.owner() (lib/openzeppelin-contracts/contracts/access/Ownable.sol#56-58) (function)

### True positive

lacks a zero-check on address assignment in constructor

### True positive

Different versions of Solidity are used:

### False positive

Dead code. Happens inside OZ imported contracts

### True positive

Incorrect versions of Solidity. Should lock versions in

### True positive

State variable that could be immutable should be immutable

## MilleniumNFT.sol

### False positive

Incorrect exponentiation. Only happening in imported OZ contracts

### False positive

Divide before multiply. Only happening in imported OZ contracts

### False positive

Local variable shadowing. Ok in this case in the constructor

### False positive

Zero address validation. Happens inside OZ imported contracts

### False positive

Uses assembly. This happens in imported contracts, not my own code

### True positive

Different versions of Solidity are used

### False positive

Dead code. Happens inside OZ imported contracts

### True positive

Incorrect versions of Solidity. Should lock versions in

### False positive

Low level call in MilleniumNFT.withdraw() (src/ecosystem1/MilleniumNFT.sol#60-63): - (sent) = address(this).call{value: address(this).balance}() (src/ecosystem1/MilleniumNFT.sol#61)
Ok in this case, success is checked

## RewardToken.sol

### False positive

Uses assembly. This happens in imported contracts, not my own code

### True positive

Different versions of Solidity are used:

### False positive

Dead code. Happens inside OZ imported contracts

### True positive

Incorrect versions of Solidity. Should lock versions in

### False positive

Low level call. Only happening in imported OZ contracts

### False positive

Param with underscore is not in mixedCase. Ok because '\_to' and '\_amount' just one word

## Stake.sol

### True positive

dangerous strict equality: - require(bool,string)((block.timestamp - lastTime >= 86400) || lastTime == 0,Unable to withdraw yet)

### False positive

Reentrancy
External calls: - decimals = uint256(rewardToken.decimals()) (src/ecosystem1/Stake.sol#50)
State variables written after the call(s): - lastWithdrawal[msg.sender] = uint48(block.timestamp) (src/ecosystem1/Stake.sol#51)
Stake.lastWithdrawal (src/ecosystem1/Stake.sol#16) can be used in cross function reentrancies: - Stake.getTokenRewards(uint256) (src/ecosystem1/Stake.sol#43-53)
Ok in this case. Follow CEI pattern and external calls not able to manipulate

### False positive

Uses timestamp for comparisons
Dangerous comparisons: - require(bool,string)((block.timestamp - lastTime >= 86400) || lastTime == 0,Unable to withdraw yet) (src/ecosystem1/Stake.sol#48)
Ok in this case. Acceptable variance for time bases calculations

### True positive

Incorrect versions of Solidity. Should lock versions in

### True positive

Incorrect versions of Solidity. Should lock versions in

### True positive

Stake (src/ecosystem1/Stake.sol#15-54) should inherit from IERC721Receiver

### False positive

Parameter not in mixedCase

### True positive

Unused state variable

### True positive

State variable that could be immutable should be immutable

## GetPrimes.sol

### False positive

a local variable never initialized

### False positive

External calls inside a loop. Ok in this case since only a view function, can still be manipulated but no incentive to do so

### True positive

Incorrect versions of Solidity. Should lock versions in

### False positive

Param with underscore is not in mixedCase. Ok because '\_amount' just one word

### True positive

Redundant expression "i (src/ecosystem2/GetPrimes.sol#30)" inGetPrimes (src/ecosystem2/GetPrimes.sol#12-53)]

### True positive

State variable that could be immutable should be immutable

## PrimeNFT.sol

### False positive

Incorrect exponentiation. Only happening in imported OZ contracts

### False positive

Divide before multiply. Only happening in imported OZ contracts

### False positive

Variable shadowing. Only happening in imported OZ contracts

### False positive

Uses assembly. This happens in imported contracts, not my own code

### True positive

Different versions of Solidity are used

### False positive

Dead code. Happens inside OZ imported contracts

### True positive

Incorrect versions of Solidity. Should lock versions in
