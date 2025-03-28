// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;
import "./ICounter.sol";


contract Counter is ICounter {
    uint public count;
    function increment() external override {
        count+=1;
    }

}