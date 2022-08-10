// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

library RemcoMathLib {
    /// @notice Calculates (x × y ÷ denominator) rounded down with full precision. 
    /// Reverts if result does not fit within a uint256 value or denominator is zero.
    /// @dev Credit to Remco Bloemen under MIT license https://xn--2-umb.com/21/muldiv
    function mulDiv(
        uint256 x, 
        uint256 y, 
        uint256 denominator
    ) internal pure returns (uint256 z) {
        assembly {
            let mm := mulmod(x, y, not(0))
            let z0 := mul(x, y)
            let z1 := sub(sub(mm, z0), lt(mm, z0))

            // Short-circuit to save gas for non-overflow cases, 256 by 256 division.
            if iszero(z1) {
                let freeMemoryPointer := mload(0x40)
                mstore(freeMemoryPointer, div(z0, denominator))
                return(freeMemoryPointer, 32)
            }

            // Make sure the result is less than 2**256 and ensure denominator is not zero.
            if iszero(gt(denominator, z1)) { 
                revert(0, 0) 
            }
            
            let twos := and(sub(0, denominator), denominator)
            denominator := div(denominator, twos)
    
            let remainder := mulmod(x, y, denominator)
            z1 := sub(z1, gt(remainder, z0))
            z0 := add(div(sub(z0, remainder), twos), mul(z1, add(div(sub(0, twos), twos), 1)))

            // Invert denominator mod 2**256. Now that denominator is an odd number, 
            // it has an inverse modulo 2**256 such that denominator * inv = 1 mod
            // 2**256. Now we compute the inverse by starting with a seed that is
            // correct for four bits (denominator * inv = 1 mod 2**4).
            let inv := xor(mul(3, denominator), 2)

            // Now we use Newton-Raphson iteration to improve the precision. Thanks to 
            // Hensel's lifting lemma, this also works in modular arithmetic, doubling 
            // the correct bits in each step.
            inv := mul(inv, sub(2, mul(denominator, inv))) // inv mod 2^8
            inv := mul(inv, sub(2, mul(denominator, inv))) // inv mod 2^16
            inv := mul(inv, sub(2, mul(denominator, inv))) // inv mod 2^32
            inv := mul(inv, sub(2, mul(denominator, inv))) // inv mod 2^64
            inv := mul(inv, sub(2, mul(denominator, inv))) // inv mod 2^128
            inv := mul(inv, sub(2, mul(denominator, inv))) // inv mod 2^256
            
            // Because the division is now exact we can divide by multiplying with the 
            // modular inverse of denominator. This will give us the correct result modulo 
            // 2**256. Since the precoditions guarantee that the outcome is less than 2**256, 
            // this is the final result. We don't need to compute the high bits of the result 
            // and prod1 is no longer required.
            z := mul(z0, inv)
        }
    }
}