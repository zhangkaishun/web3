// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;


/**
public
声明为 public 的函数或变量，他们既可以在合约内部访问，也以合约接口形式暴露合约外部（其他合约或链下）调用。

另外，public 类型的状态变量，会自动创建一个同名的外部函数（称为访问器），来获取状态变量的值。

external
external 不可以修饰状态变量，声明为 external 的函数只能在外部调用，因此称为外部函数。

如何想在合约内部调用外部函数，需要使用this.func() （而不是 func()）。


internal
声明为 internal 函数和状态变量只能在当前合约中调用或者在派生合约（子合约）里访问。


private
声明为 private 函数和状态变量仅可在当前定义它们的合约中使用，并且不能被派生合约使用。
**/

contract first{
    // 状态变量默认都是storage
   //不可变量 
    uint immutable  x;
    //如果没有可见性修饰符，默认为 internal
    uint256 public count;

     //常量 常量不占用合约的存储空间，而是在编译时使用对应的表达式值替换常量名
     //constant 目前仅支持修饰 strings及值类型。
    string constant te="abc";

    address public  owner;

 


   constructor(){
    x=30;
    count=10;
    owner=msg.sender;
   }

   function incrementCount(uint a) public {
    count+=a;
   }

    //在 Solidity 中，string 是 动态数组（本质上是 bytes 数组），
    //而 Solidity 要求所有动态数组在返回参数（或函数参数）中必须指定存储位置 (storage、memory 或 calldata)。如果没有指定，编译器无法确定该数据应该存储在哪里，因此会报错。

    //固定大小的值类型（如 uint, bool, address）不需要指定存储位置
    //动态数据类型（如 string, bytes, array, mapping）必须指定存储位置，因为 Solidity 需要明确知道如何管理这些数据

    //Solidity 主要有三种数据存储位置：

       // storage：长期存储在区块链上（适用于状态变量）。
       // memory：临时存储在执行合约时的内存中（适用于函数调用）。
       // calldata：特殊的只读数据位置，适用于 external 函数的参数。

    /** 
        状态可变性（mutability）
                有些函数还还会有一个关键字来描述该函数，会怎样修改区块链状态，形容函数的可变性有 3 个关键字：

                view：用 view 修饰的函数，称为视图函数，它只能读取状态，而不能修改状态。
                pure：用 pure 修饰的函数，称为纯函数，它既不能读取也不能修改状态。
                payable：用 payable 修饰的函数表示可以接受以太币，如果未指定，该函数将自动拒绝所有发送给它的以太币。
                view , pure , payable 通常被称为修饰符


    */
    
   function getCount() public view returns(uint256,string memory){
    return (count,te);
   }


    /** 

    视图函数 不需要提交交易 不需要花费交易费用 

            而交易需要全网节点共识之后才会真正确认，状态修改才会生效。
    如果在一个会修改状态的函数中调用视图函数，那么视图函数会消耗Gas
    */
   function viewFunction(uint i) public pure returns(uint){
    return i+1;
   }

}