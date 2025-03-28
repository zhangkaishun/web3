// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


/** 
我们可以通过 IERC20 接口调用MyToken 的 transfer 方法，把奖励合约中的MyToken发送给用户。



**/
contract MyToken is ERC20 {

        constructor() ERC20("MyToken", "MTK") {}


}


//我们可以通过 IERC20 接口调用MyToken 的 transfer 方法，把奖励合约中的MyToken发送给用户。


//sendAward函数用来发送奖金，当然需要需要在 Award 合约创建好之后，向 Award 转入一些MyToken。



contract Award {

    IERC20 immutable token;

    constructor(address t){
        token=IERC20(t);
    }

    function sendAward(address user) public {
             token.transfer(user, 100);
    }


}