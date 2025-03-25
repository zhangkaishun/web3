// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;

contract testArray{

    uint[10] tens;//固定长度的数组
    uint[] numbers; //动态长度的数组

/** 
若元素类型为T，声明为T [k]， 表示固定长度为k的数组，类似的还可以有：address [10] admins， 此时 admins 最多有10个地址。 若元素类型为T，声明为T []， 表示动态长度的数组，类似的还可以有： address [] admins。

**/
    address[10] accounts; 


    uint [] public u = [1, 2, 3];
    string[4] adaArr = ["This", "is", "an", "array"];


    bytes bs0="abcdef";
    string str1="zks123";


    function copy(uint[] calldata arrs) public {
            numbers=arrs; //赋值时，不同的数据位置的变量会进行拷贝

    }

    function handle(uint[] memory a) internal {}

    function init(uint length) public {
        //数组用memory 不能动态扩容，如果是storage 则可以
        uint[] memory abc=new uint[](length); //默认值为0
        uint sum=0;
        for(uint index=0;index<length;index++){
                sum=sum+abc[index];
        }


    }

    /** 

        数组成员
        数组类型可以通过成员属性内获取数组状态以及可以通过成员函数来修改数组的状态，这些成员有：

        length属性：表示当前数组的长度（只读属性：不能通过修改 length 属性来更改数组的大小）。 如果是new创建的内存数组，一经创建长度就固定了，不可以修改。
        push()：用来添加新的零初始化元素到数组末尾，并返回元素的引用，以便修改元素的内容，如：x.push().t = 2或x.push() = b，push方法只对存储（storage）中的动态数组有效。
        push(x)：用来添加给定元素到数组末尾。push(x) 没有返回值，方法只对存储（storage）中的动态数组有效。
        pop()：用来从数组末尾删除元素，数组的长度减1，会在移除的元素上隐含调用delete，释放存储空间（及时释放不使用的空间，可以节约gas）。pop()没有返回值，pop()方法只对存储（storage）中的动态数组有效。


    **/



        /** 

        高效移除元素
        **/
    function remove(uint index) public {
            uint length=accounts.length;
            if(index=length-1){
                accounts.pop();
            }else{
                accounts[index]=accounts[length-1];
                accounts.pop();

            }
            //数组会被重置 lengtth也为0
            delete accounts;


    }





}