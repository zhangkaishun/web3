// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Logic {
    uint private value;

    function getValue() public view returns (uint){
        return value;
    }
    function setValue(uint _value) public {
        value = _value;
    }
    function incrementValue() public {
        value += 1;
    }


}