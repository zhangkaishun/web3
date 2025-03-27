// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;


/** 
函数修改器可以用来改变一个函数的行为，比如用于在函数执行前检查某种前置条件。

函数修改器使用关键字 modifier , 以下代码定义了一个 onlyOwner 函数修改器， 然后使用修改器 onlyOwner 修饰 transferOwner() 函数：



**/
contract modifierTest{
    address owner;

    function owned() public{
        owner=msg.sender;
    }

    modifier onlyOwner{
        require(owner==msg.sender,"only oner call call this function.");
        _;
    }

    function transferOwner(address _new0) public onlyOwner{
        owner=_new0;
    }


    //修改器可以带参数
    modifier over22(uint age){
        require(age>=22,"too young.");
        _;
    }

    function marry(uint age) public over22(age) onlyOwner{}


}