// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;



/** 
transfer()
        特点：

        gas 限制：2300（仅适用于 fallback 或 receive ）

        失败时会自动 revert（交易回滚）

        推荐使用，因为它更安全
2. send()

        ool success = addr.send(amount);
        require(success, "Send failed");
        ✅ 特点：

        gas 限制：2300

        不会自动回滚，只会返回 true/false

        需要手动检查返回值（否则可能丢失资金）
 call.value()（更灵活但风险更高）

            (bool success, ) = addr.call{value: amount}("");
            require(success, "Call failed");
        特点：

        无 gas 限制（可以消耗比 2300 更多的 gas）

        推荐用于 call 复杂合约

        比 transfer() 和 send() 更危险，可能导致重入攻击
**/
contract TestSendAndTransfer{

    address payable add  ;

    function transferTest()public  {
            add.transfer(10);

    }

    function testSend() public {
      bool success=  add.send(10);
      require(success,"send failed");
    }


}