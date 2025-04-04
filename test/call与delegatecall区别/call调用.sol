// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;

contract Callee{

    uint public num;


    function setNum(uint _num20) public {
        num = _num20;
    }

}


contract Caller{

    function callSetNum(address _addr,uint _num) public returns (bool) {
            //call 调用，addr 对应的合约的msg.sender为 Caller 合约的地址
            //并且 num 存储在 Callee 合约的存储 修改的Callee合约中的num
            //返回 bool 类型，表示调用是否成功。
            (bool success,)=_addr.call(abi.encodeWithSignature("setNum(uint256)", _num));
            return success;
    }


}