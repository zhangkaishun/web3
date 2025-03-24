// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;

contract Hello{

 function sayhello() public pure  returns(uint){
    return 10;
 }


}


 contract HelloCreatetor{
        uint public x;
        Hello public h;
        function createHello() public returns(address){
            h=new Hello();
            return address(h);
        }

    function calHi() public returns(uint){
        x=h.sayhello();
        return x;
    }

    /** 
        额外知识点：如何区分合约及外部地址
经常需要区分一个地址是合约地址还是外部账号地址，区分的关键是看这个地址有没有与之相关联的代码。EVM提供了一个操作码EXTCODESIZE，用来获取地址相关联的代码大小（长度），如果是外部账号地址，则没有代码返回。因此我们可以使用以下方法判断合约地址及外部账号地址。

    **/

    function isContract(address addr) public view returns (bool) {
            uint size;
             assembly { size := extcodesize(addr) }
            return size > 0;

    }

 }
