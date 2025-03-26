// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;

/** 
        键仅支持solidity内置类型、bytes/string/合约/枚举    ，不能是复杂类型：如：映射、变长数组、结构体
        值没有任何限制

        映射不能遍历


**/

contract testMapping{
        mapping(address=>uint) public balance; //默认为storage ，映射变量只能保存在storage

        //映射可以嵌套
        mapping(address=>mapping(address=>uint)) balance2;

        function update(uint newBalance) public {
            balance[msg.sender]=newBalance;
        }

        function getBalance() public view returns(uint){
            return balance[msg.sender];
        }


        //可迭代映射
        //有时候，可能希望在智能合约中对映射进行迭代或者计算映射长度，这时可以可以创建一个键的数组，例如：
        address[] users;

        function insert(address key,uint value) public {
            users.push(key);
            balance[key]=value;
        }


    
}