// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;


//抽象合约

/** 
有一些父合约，我们创建他们，只是为了在合约之间建立清晰的结构关系，而不是真实的部署这些父合约。

我们可以在这些不想被部署的合约前加上 abstract 关键字，表示这是一个抽象合约。
抽象合约由于不需要部署，因此可以声明没有具体实现的纯虚函数，纯虚函数声明用";"结尾，而不是"{ }"，例如：



**/
abstract contract AbstrBase{
    function    helloWorld() virtual public  ;
}

contract Base{

    uint public a;
    constructor(uint _a){
        a=a+_a;
    }

    // virtual 关键字用于允许子合约重写（override）父合约中的函数。 
    //如果一个函数需要被子合约重写，必须加 virtual。
        //✅ 如果子合约要重写父合约的 virtual 函数，必须使用 override 关键字。


    function fool() public virtual{
        a=a+1;
    }


}

contract Base2{

    uint public b;
   constructor(uint _a){
        b=b+_a;
    }

}

contract Sub is Base(2){
    uint public b;
    constructor(){
        b=2;
    }

    function fool() public virtual override  {
        super.fool();// 使用super调用父合约的函数
        b =b+1;
    }
}


contract Sub2 is Base{
    uint public b;
    //动态传递参数到父合约构造函数
    constructor(uint c) Base(c){
        b=2;
    }

    function fool() public virtual override  {
        super.fool();// 使用super调用父合约的函数
        b =b+1;
    }
}

//合约多重继承
contract sub3 is Base, Base2{
    uint aaa;
    //继承多个合约传递参数
    constructor(uint d) Base(d) Base2(2){

    }


}