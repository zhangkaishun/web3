// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;

/** 

接口的作用主要体现在以下几个方面：

规范行为：接口定义了一组方法，要求实现这个接口的合约必须提供这些方法的具体实现。通过实现接口，可以确保一组合约拥有相同的方法，并且这些方法的功能和行为是一致的，从而增强了代码的一致性和可预测性。

解耦合：接口可以将定义方法的部分与具体实现合约分离，从而实现了解耦合。因此我们可以基于接口来进行合约间的相互调用， 而不是基于实现。

**/
interface ICounter {
    //接口中的所有方法都是隐含的 virtual 方法，因此即便没有 virtual，也可以被重写。


    function increment() external ;
}