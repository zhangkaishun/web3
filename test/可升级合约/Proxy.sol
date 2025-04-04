// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Proxy {
    // 固定的 IMPLEMENTATION_SLOT 常量，通过 keccak256 计算后硬编码
    bytes32 internal constant _IMPLEMENTATION_SLOT = 
        0x3f0b3fbbce1e4c5f7c91d1b1a4c871bfa7a43fbd13abbbb1744b59f235b7fabe;  // 这是 keccak256("eip1967.proxy.implementation") 的值

    event Upgraded(address indexed newImplementation);

    constructor(address _logic) {
        _setImplementation(_logic);
    }

    function _getImplementation() internal view returns (address impl) {
        assembly {
            // 使用已预计算的 IMPLEMENTATION_SLOT 常量
            impl := sload(_IMPLEMENTATION_SLOT)
        }
    }

    function _setImplementation(address newImplementation) internal {
        assembly {
            // 使用已预计算的 IMPLEMENTATION_SLOT 常量
            sstore(_IMPLEMENTATION_SLOT, newImplementation)
        }
    }

    function upgradeTo(address newImplementation) external {
        _setImplementation(newImplementation);
        emit Upgraded(newImplementation);
    }

    receive() external payable {}

    fallback() external payable {
        address impl = _getImplementation();
        require(impl != address(0), "Implementation not set");


        /** 

         let ptr := mload(0x40)
作用：这行代码将 0x40 位置的数据加载到 ptr 变量中。

mload(0x40) 获取的是 "free memory pointer"，即指向 Solidity 存储中下一个空闲内存位置的指针。Solidity 使用 0x40 作为其内存管理的特殊位置。

通过该指针，可以动态地管理内存，避免固定内存位置的冲突。

2. calldatacopy(ptr, 0, calldatasize())
作用：这行代码将调用数据（calldata）复制到内存中的 ptr 所指向的位置。

calldatacopy 是一个内联汇编函数，它将从 calldata 中复制数据到内存中。

ptr 是目标内存位置（前面我们加载了“free memory pointer”）。

0 是 calldata 的偏移量（从 calldata 的开始处开始复制）。

calldatasize() 返回调用数据的大小，也就是我们要复制的数据长度。

3. let result := delegatecall(gas(), impl, ptr, calldatasize(), 0, 0)
作用：使用 delegatecall 执行目标合约的代码，并传递调用数据。

delegatecall 是一个特殊的操作，它将合约的代码执行委托给另一个合约，并且调用者的 storage 和 msg.sender 等信息不会变化，只会执行目标合约的代码。

gas()：将剩余的 gas 传递给目标合约。

impl：目标合约的地址（通常是存储在代理合约中的实现合约地址）。

ptr：复制的调用数据的内存位置。

    calldatasize()：调用数据的大小，即从调用中传递的参数的长度。

    0, 0：这两个参数表示返回数据的内存位置（返回数据会存储在 0 位置，但这里我们暂时不关心具体位置）。

    delegatecall 会返回一个布尔值 result，如果执行成功，则 result 为 1，否则为 0。

    4. let size := returndatasize()
    作用：获取返回数据的大小。

    returndatasize() 返回由目标合约执行后返回的数据的大小。

    5. returndatacopy(ptr, 0, size)
    作用：将目标合约返回的数据复制到内存中的 ptr 指向的地址。

    returndatacopy 是一个内联汇编函数，它将返回数据从 0 位置复制到 ptr 所指向的位置，复制的长度为 size。

    6. mstore(0x40, add(ptr, size))
    作用：更新 "free memory pointer"。

    mstore(0x40, add(ptr, size)) 这行代码更新了 0x40 的指针，将其移动到新的空闲内存位置。具体来说，它将指针移动到 ptr + size，即返回数据后面的空闲内存区域。

    7. switch result
    作用：根据 delegatecall 的执行结果，判断是返回数据还是发生错误。

    switch result 是根据 result 的值（它是 delegatecall 的返回值）来判断是否成功执行。

    8. case 0 { revert(ptr, size) }
    作用：如果 result 为 0，说明 delegatecall 执行失败，合约会调用 revert。

    revert(ptr, size) 将复制返回数据并回滚交易，这样外部调用者会收到错误信息。

    9. default { return(ptr, size) }
    作用：如果 result 为非 0（即执行成功），则会将目标合约的返回数据返回给调用者。

    return(ptr, size) 将从 ptr 指向的内存位置返回数据，长度为 size。

        **/
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize())

            let result := delegatecall(gas(), impl, ptr, calldatasize(), 0, 0)
            let size := returndatasize()

            returndatacopy(ptr, 0, size)
            mstore(0x40, add(ptr, size))

            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }
}
