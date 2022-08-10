// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import {Test}         from "forge-std/Test.sol";
import {FullMath}     from "./FullMath.sol"; // reference
import {RemcoMathLib} from "../RemcoMathLib.sol";


/**
NOTE: to test gas you must change FullMath.mulDiv() & RemcoMathLib.mulDiv()
function visibility to public temporarily.
╭───────────────────┬─────────────────┬─────┬────────┬─────┬─────────╮
│ FullMath contract ┆                 ┆     ┆        ┆     ┆         │
╞═══════════════════╪═════════════════╪═════╪════════╪═════╪═════════╡
│ Deployment Cost   ┆ Deployment Size ┆     ┆        ┆     ┆         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ 74748             ┆ 431             ┆     ┆        ┆     ┆         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ Function Name     ┆ min             ┆ avg ┆ median ┆ max ┆ # calls │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ mulDiv            ┆ 437             ┆ 588 ┆ 588    ┆ 739 ┆ 2       │
╰───────────────────┴─────────────────┴─────┴────────┴─────┴─────────╯
╭───────────────────────┬─────────────────┬─────┬────────┬─────┬─────────╮
│ RemcoMathLib contract ┆                 ┆     ┆        ┆     ┆         │
╞═══════════════════════╪═════════════════╪═════╪════════╪═════╪═════════╡
│ Deployment Cost       ┆ Deployment Size ┆     ┆        ┆     ┆         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ 67942                 ┆ 397             ┆     ┆        ┆     ┆         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ Function Name         ┆ min             ┆ avg ┆ median ┆ max ┆ # calls │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ mulDiv                ┆ 331             ┆ 504 ┆ 504    ┆ 678 ┆ 2       │
╰───────────────────────┴─────────────────┴─────┴────────┴─────┴─────────╯
 */
contract RemcoMathLibTest is Test {
    
    // function testGasFullMath() public {
    //     FullMath.mulDiv(type(uint256).max, 1, 1);
    // }

    // function testGasRemcoMathLib() public {
    //     RemcoMathLib.mulDiv(type(uint256).max, 1, 1);
    // }

    // function testGasFullMathOverflow() public {
    //     FullMath.mulDiv(type(uint256).max, 2, 2);
    // }

    // function testGasRemcoMathLibOverflow() public {
    //     RemcoMathLib.mulDiv(type(uint256).max, 2, 2);
    // }

    // Kind of a pain in the ass to fuzz tbh
    function testFuzz(uint128 a, uint128 b, uint128 c) public {

        vm.assume(c > 0); // avoid division by zero error

        uint256 fullMath = FullMath.mulDiv(a, b, c);
        uint256 remcoMath = RemcoMathLib.mulDiv(a, b, c);

        assertEq(fullMath, remcoMath);
    }
}
