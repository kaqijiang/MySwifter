
//: # page2 Variable
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation


/**
 
 使用let来声明常亮 使用var来声明变量
 
 OC：
 
 >先定义在初始化
 
 int num;
 num = 10;
 
 >定义同时初始化
 
 int num1 = 20;
 
 Swift:
 
 >先定义再初始化
 
 var num //报错
 
 没有指定数据类型。在swift中要想先定义一个变量，以后使用的时候再初始化，需要告诉编译器变量的类型
 
 */

var num: Int
num = 10

/**
 >定义同时初始化
 如果swift中定义同时初始化一个变量，可以省略指定类型，因为编译器会根据初始化的值自动推导出变量的数据类型(其它语言是没有类型推断的)
 以后开发中在定义同时初始化，就没有必要去指定数据类型，除非需要明确数据类型长度或者自定义时不初始化才需要指定类型。
 
 */
var num1: Int = 20

var num3 = 30

/**
>你可以用任何喜欢的字符作为常量和变量名，包括 Unicode 字符：
 常量与变量名不能包含数学符号，箭头，保留的（或者非法的）Unicode 码位，连线与制表符。也不能以数字开头，但是可以在常量与变量名的其他地方包含数字。
 */

var 🍚 =  100
var 减肥 = 200

print(🍚)


/**
    常量： 
 常量的用途: 某些值以后不需要改变, 例如身份证
 OC:
 const int num = 200
 
 Swift://可以先定义后初始化，但是使用之前没初始化的话会crash.
 let num: int
 num = 100
 
 let num1 = 100
 
 */

let num4: Int = 200

let num5 = 100

let num6: Int
num6 = 300

//注意再次赋值num6就会报错
//num6 = 2



//: [Next](@next)

