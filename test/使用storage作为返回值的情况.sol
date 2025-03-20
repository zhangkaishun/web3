// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;


/** 

当返回 storage 时，函数返回的是状态变量的引用（指针），而不是数据副本，因此可以直接修改合约的状态变量。

    📌 1. 什么时候可以用 storage 作为返回值？
✅ 适用场景：

    返回合约内部的 storage 状态变量的引用
    只能用于 internal 或 private 函数
    适用于数组、映射（mapping）、结构体（struct） string
    节省 gas（避免 memory 拷贝）
    ❌ 不能用于 public 或 external

    这样做会暴露 storage 变量的引用，可能导致外部合约直接修改合约存储数据，造成安全问题。


*/

contract StorageReturnTest {

        string[] public names;
        constructor(){
            names.push("zks1");
            names.push("zks2");
        }

        function getNames() internal returns(string[] storage ){ 
                return names;

        }

        function changeNamesStorage() public {
                //由于返回值是storage修饰，此处不能使用memory 修饰
                //返回的是引用
               string[] storage t= getNames();
               t.push("zks3");
         }


         function changeNamesMemory() public view returns(string[] memory) {
                //这个相当于是拷贝了一份，修改不影响原来的操作
               string[] memory t= getNamesTemp();
               t[0]="zks4";
               return t;

         }


/** 
         function changeNamesMemory() public {
                
               string[] memory t= getNamesTemp();
               t.push("zks4");

         }
         这个列子会报错，返回memory ,不能执行push ,除非新建一个

        数组操作对比：storage 和 memory 的不同
                操作/方法	storage 数组	memory 数组
                声明数组	可以声明和初始化大小（动态/静态）	必须在声明时指定大小或通过 new 创建
                修改大小	可以使用 .push(), .pop() 等动态改变数组大小	不可以使用 .push() 或 .pop()
                修改元素	可以直接修改元素，如 arr[i] = value;	可以修改元素，但数组大小不可变
                循环修改	可以遍历并修改数组元素	可以遍历并修改数组元素
                数据复制	可以通过引用复制数据，修改会影响原始数据	必须手动复制数据，修改不会影响原始数据
                存储生命周期	永久存储在区块链上，修改会产生 gas 消耗	仅在当前函数调用期间有效，执行完后销毁



**/

        function getNamesTemp() public view returns (string[] memory) {
                return names;
        }



}