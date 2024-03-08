// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Dex.sol';
import "./ozcontracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {}

    function mint(address _to, uint256 _amount) external {
        _mint(_to, _amount);
    }
}

contract AttackDex {
    Dex dex;
    MockERC20 token0;
    MockERC20 token1;

    constructor () {
        dex = new Dex();
        token0 = new MockERC20("Token0", "T0");
        token1 = new MockERC20("Token1", "T1");

        token0.mint(address(this), 110);
        token1.mint(address(this), 110);

        token0.approve(address(dex), 100);
        token1.approve(address(dex), 100);

        dex.addLiquidity(address(token0), 100);
        dex.addLiquidity(address(token1), 100);

        dex.renounceOwnership();
    }

    function echidna_attack_dex() public view {
        assert(token0.balanceOf(address(dex)) > 0 && token1.balanceOf(address(dex)) > 0 );
    }
}