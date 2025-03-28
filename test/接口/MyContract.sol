// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;

import "./ICounter.sol";
import "./Counter.sol";

contract MyContract{

    function incrementCounter(address _addr) external {
        //高亮代码ICounter(_counter).increment(); 的含义是：把合约地址 _counter 类型转化为接口ICounter类型（接口类型与合约类型一样，也是自定义类型），再调用接口内的increment() 方法。
            ICounter(_addr).increment();

        //建议使用接口
           Counter(_addr).increment();

    }


}