// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;


contract BaseERC20{
        //代币名称
        string public name;
        //代币符号
        string public symbol;
        //小数位数
        uint8 public decimals = 18;
        //总供应量
        uint public totalSupply;
        //各地址拥有的代币数量
        mapping(address => uint) balaces;




}