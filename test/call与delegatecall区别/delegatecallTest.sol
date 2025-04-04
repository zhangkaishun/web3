// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;


/** 
调用方式	msg.sender
call	Caller 合约的地址
delegatecall	原始调用者（EOA）的地址
如果你希望被调用的合约知道它是由哪个合约调用的，使用 call；如果你希望代码执行时仍然认为它是由原始用户调用的，使用 delegatecall。


使用函数delegatecall()也是类似的方式，delegatecall被称为“委托调用”，
顾名思义，是把一个功能委托到另一个合约，它使用当前合约（发起调用的合约）的上下文环境（如存储状态，余额 等），同时使用另一个合约的函数。 delegatecall()多用于调用库代码以及合约升级。

**/
contract Logic {
    uint public num;

    function setNum(uint _num) public {
        num=_num;
    }


}

contract Proxy{

    //🏗 Solidity 变量默认存储规则

    //💡 存储槽（Storage Slot）编号从 0 开始，每个槽 32 字节（256 位）。
//小于 32 字节的变量会被紧密打包（Storage Packing），尽量合并到同一个 Slot（节省 Gas）。

//动态数组、映射、结构体等复杂数据类型不会使用连续 Slot，而是用 keccak256 计算存储地址

    uint public num; // 必须和 Logic 合约的存储结构一致


    function delegateSetNum(address _addr,uint _num) public returns (bool){
            //被调用的合约的msg.sender 与Proxy 的msg.sender一样
            //数据存储在num 修改的是当前合约的num
            (bool success,)=_addr.delegatecall(abi.encodeWithSignature("setNum(uint256)", _num));
            return success;

    } 



}