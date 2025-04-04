// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Logic2{

    uint private value;

    function getValue() view public returns (uint){
        return value;
    }

    function setValue(uint _value) public {
        value=_value;
    }
    function incrementValue() public {
        value++;
    }
    function decrementValue() public {
        value--;
    }

}