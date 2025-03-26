// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;
/** 

可以在合约中明确声明两个函数来表示合约可以接收 ETH， 他们是 receive 函数和 fallback函数。



**/

contract TestReceiveETH {


        //合约的 receive（接收）函数是一种特殊的函数，专门用来表示合约可以接收以太币，接收函数的声明为：
        //函数名只有一个receive关键字，而不需要function关键字，也没有参数和返回值，并且必须是 external可见性和payable修饰。

        //一个合约最多有一个接收函数。
        event Received(address,uint);


        receive() external payable {
                emit Received(msg.sender,msg.value);
        }


        //fallback函数

        /** 

            和接收函数类似，fallback函数也是一个特殊的函数，中文一般称为“回退函数”。

            如果用户对合约进行调用时，合约中没有找到用户要调用的函数， fallback 函数就会被调用（可以理解为最终回退到这个函数）。

            同样的，若是对合约进行 ETH 转账，而合约又没有实现receive函数，也会回退到 fallback 函数（不过此时要求fallback函数需要能接收ETH， 有 payable 修饰）。


        **/
        function fallback(uint _amount) external {
                // 调用发送 ETH
                (bool sent, ) = msg.sender.call{value: _amount}(new bytes(0));
        }
        

}