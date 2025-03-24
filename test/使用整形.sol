// SPDX-Licence-Identifier: MIT

// SPDX-License-Ientifier: MIT
pragma solidity ~0.8.20;

contract testInt{
    int8 a=-1;
    int16 b=2;

    uint32 c=10;
    uint8 d=16;

    function add(uint x,uint y) public pure returns(uint z){
        z=x+y;
    }


    function divide(uint x,uint y) public pure returns(uint z){
        return x/y;
    }



}