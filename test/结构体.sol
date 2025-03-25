// SPDX-Licence-Identifier: MIT
pragma solidity ~0.8.20;

contract StructTest{
    Person person;
    Person person2=Person(address(0x456,true,18);
    Person person3=Person({account:0x456,gender:true,age:18});

    function updatePerson2(){
        person.account=0x456;
        person2.gender=true;
    }

}

struct Person{
    address account;
    bool gender;
    uint8 age;



}

struct Student{
    address account;
    bool gender;
    uint8 age;
    mapping(string=>uint) score;
     //   Person child;  //  错误
    mapping(string=>Person) childs;  // 或  Person[]  manyChilds; 
     Person[]  manyChild;


}