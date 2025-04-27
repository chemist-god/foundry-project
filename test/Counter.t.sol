// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    // This function sets up the environment before each test
    function setUp() public {
        counter = new Counter();
    }

    // Test the 'inc' function
    function test_Increment() public {
        counter.inc(); // Increment the counter by 1
        assertEq(counter.get(), 1); // Check that the counter is now 1
    }

    // Test the 'dec' function, ensure it doesn't underflow
    function test_Decrement() public {
        counter.inc(); // Increment to 1
        counter.dec(); // Decrement back to 0
        assertEq(counter.get(), 0); // Ensure the counter is 0

        // Expect revert when trying to decrement from 0
        vm.expectRevert("Counter: cannot decrement below zero");
        counter.dec(); // This should revert
    }

    // Test the 'reset' function
    function test_Reset() public {
        counter.inc(); // Increment to 1
        counter.reset(); // Reset the counter to 0
        assertEq(counter.get(), 0); // Ensure the counter is reset to 0
    }
}
