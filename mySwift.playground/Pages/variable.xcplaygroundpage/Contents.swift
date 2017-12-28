
//: # page2 Constants and Variables
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation


/**
 常量和变量
 
 常量和变量把名字（例如 maximumNumberOfLoginAttempts 或者 welcomeMessage ）和一个特定类型的值（例如数字 10 或者字符串 “Hello”）关联起来。常量的值一旦设置好便不能再被更改，然而变量可以在将来被设置为不同的值。
 
 声明常量和变量
 使用let来声明常量 使用var来声明变量
 
 let maximumNumberOfLoginAttempts = 10
 var currentLoginAttempt = 0
 
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
var num:Int
num = 10


/**
 >定义同时初始化
 如果swift中定义同时初始化一个变量，可以省略指定类型，因为编译器会根据初始化的值自动推导出变量的数据类型(其它语言是没有类型推断的)
 以后开发中在定义同时初始化，就没有必要去指定数据类型，除非需要明确数据类型长度或者自定义时不初始化才需要指定类型。
 dynamicType在Swift 3.0中已经被舍弃,我们可以使用type(of:...)来代替
 */
var num1 : Int = 20

var num2 = 30.0

let num2types = type(of: num2)
print(num2types)


/**
 命名常量和变量
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
//num6 = 2 error

/**
 输出常量和变量
 你可以使用 print(_:separator:terminator:) 函数来打印当前常量和变量中的值。默认换行。
 如果不需要换行需要执行terminator:""
 
 Swift 使用字符串插值 的方式来把常量名或者变量名当做占位符加入到更长的字符串中，
 然后让 Swift 用常量或变量的当前值替换这些占位符。
 将常量或变量名放入圆括号中并在括号前使用反斜杠将其转义：
 
 也可以使用 “+”来链接字符串
 
 */

print("ada", terminator: "")
print("hello word")


var nums = 12

print("这个数字是：\(nums)")
print("这个数字是:",nums)


var str = "adcg"

print("这个字符串是\(str)")
print("这个字符串是"+str)

//: [Next](@next)

