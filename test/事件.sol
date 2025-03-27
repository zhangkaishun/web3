// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;

/** 
事件是通过关键字event来声明的，event 不需要实现，只需要定义其事件名和参数。

我们也可以认为事件是一个用来被监听的接口（接口同样也不需要实现）。

通过 emit 关键字可以触发事件，此时会在链上生成一个日志条目。



**/

contract testEvent {

    event Deposit(address indexed  _from,uint value);

    function deposit(uint value) public{

            emit Deposit(msg.sender,value);

    }

    
}