

//: # page16 BaseDataType
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation
/*
 if语句基本使用
 OC:
 int age1 = 10;
 int age2 = 20;
 int max;
 max = age2;
 if (age1 > age2) {
 max = age1;
 }
 NSLog(@"%d", max);
 
 if (age1 > age2) {
 max = age1;
 }else
 {
 max = age2;
 }
 NSLog(@"%d", max);
 
 如果只有一条指令if后面的大括号可以省略
 
 Swift:
 if 条件表达式 {指令}   if 条件表达式 {指令} else{指令}
 0.if后的圆括号可以省略
 1.只能以bool作为条件语句
 2.if后面的大括号不可以省略
 */

var num1 = 1
var num2 = 2

if num1 > num2 {
    print("进来了")
}

if num2 == num1 {
    print("相等")
} else {
    print("不等于")
}

var score = 99.9;
if score >= 90
{
    print("优秀")
}else if score >= 60
{
    print("良好")
}else
{
    print("不给力")
}





//: [Next](@next)
