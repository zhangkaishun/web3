// SPDX-License-Ientifier: MIT
pragma solidity ~0.8.20;


/** 
    地址类型有两种：

address：保存一个20字节的值（以太坊地址的大小）。

address payable：表示可支付地址（可接受以太币的地址），在地址格式上，其实与address 完全相同，也是20字节。

在编写合约时，大部分时候，使用address就好，当需要向地址转账时，可以使用以下代码把address 转换为address payable ：

address payable ap = payable(addr);



address payable拥有的两个成员函数transfer和send （address 没有这两个方法），transfer和send 的作用是向该地址转账，下文会进一步介绍。

**/
contract testAddr{
    address public user;

    function getUserAddress() public  returns (address) {
        
            user=msg.sender;
            return user;

    }

    function getBalance() public view returns(uint){
        return user.balance;
    }
    function testTransfer(address payable x) public {
        address myAddress=address(this);
        if(x.balance < 10 && myAddress.balance >10 ){
            x.transfer(10); //当前合约项x地址转账10 单位=
        }
    }

    function getContractBalance() public view  returns(uint) {
        return address(this).balance;
    }

    receive() external payable {
        // 处理收到的 ETH
    }
    

}