// SPDX-Licence-Identifier: MIT
// SPDX-License-Identifier: MIT
pragma solidity ~0.8.20;

contract HelloWorld {
    int a = 10;
    int c=0.5+0.5+a;
     uint public result = 0.5 + 0.5; 

    string strVar="hello world";
    function sayHello()external view returns(string memory){
            return strVar;
    }

}
